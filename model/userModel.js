import { connection } from "../config/dbConfig.js";
import { comparePass, encryptPass } from "../helpers/encrypt.js";
import { generateToken} from "../helpers/jwt.js";

export const getUsers  = async (data) => {

    try {
        const {results} = await connection.query({sql: `SELECT * FROM USUARIO;`})
        data(null, results)

    } catch(e) {

        data(e, null)  
              
    }
}


export const getUserById = async (id, data) => {

    try {

        const {results} = await connection.query({sql: `SELECT * FROM USUARIO WHERE idUsuario = :id`, params: {id: id}})
        data(null, results)

    }catch(e) {

        data(e, null)

    }
}


export const createUser =  async (data, result) => {

    let {nombre, apellido, correo, telefono, pass} = data
    nombre = nombre.split(' ')
    apellido = apellido.split(' ')

    if (nombre.length === 1 && apellido.length === 1 ) {
        nombre.push(null)
        apellido.push(null)
    }


    const res = await validate('correo', correo) && await validate('telefono', telefono)

    if (res) {
        pass = await encryptPass(pass)

        try {

            const {results} = await connection.query(
                {
                    sql: `
                    INSERT INTO USUARIO(
                        primerNombre, 
                        segundoNombre, 
                        primerApellido, 
                        segundoApellido, 
                        correo, 
                        telefono, 
                        pass, 
                        tipo, 
                        activo, 
                        foto
                        ) 
                        VALUES(:val1, :val2, :val3, :val4, :val5, :val6, :val7, 0, 1, NULL);`, 
                    params: {
                        val1: nombre[0], 
                        val2: nombre[1], 
                        val3: apellido[0], 
                        val4: apellido[1], 
                        val5: correo, 
                        val6: telefono, 
                        val7: pass
                    }
                })

            result(null, {...results, userExists: false})

        }catch(e) {

            result(e, null)

        }
    }else {

        result(null, {userExists: true})

    }
}

const validate = async (field, value) => {
    let notExists = true
    const {results} = await connection.query(
        {
            sql: `SELECT * FROM USUARIO WHERE ${field} = :val`, 
            params: {
                val: value
            }
        })
    if (results.length > 0) {
        notExists = !notExists
    }

    return notExists
}

export const trylogIn = async (data, result) => {

    let {email, password} = data
    let isPass = false

    try {

        const {results} = await connection.query(
            {
                sql: `SELECT idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass FROM USUARIO WHERE correo = :correo;`,
                params: {
                    correo: email
                }
            }
        )

        console.log(results)
        if (results.length === 1) {
            isPass = await comparePass(password, results[0].pass)
            
            if (isPass) {
                const token = generateToken(
                    {
                        email: email, 
                        password: password
                    })
                const user = {idUsuario: results[0].idUsuario, primerNombre: results[0].primerNombre, segundoNombre: results[0].segundoNombre, primerApellido: results[0].primerApellido, segundoApellido: results[0].segundoApellido, correo: results[0].correo, telefono: results[0].telefono, pass: results[0].pass} //enviar toda la info al usuario
                result(null, 
                    {
                        user: user, 
                        token: token, 
                        badCredentials: false
                    })

            }
        } else {
            console.log('no')

            result(null, {badCredentials: true})
        }

    }catch (e) {
        result(e, null)

    }
}







