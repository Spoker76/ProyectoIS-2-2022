import { connection } from "../config/dbConfig.js";


export const getAddresses  = async (data) => {
    try {
        const {results} = await connection.query(
            {
                sql: `SELECT * FROM DIRECCION;`
            }
        )
        data(null, results)
    }catch(e) {
        data(e, null)
    }
}

export const getAddressById = async (id, data) => {
    try {
        const {results} = await connection.query(
            {
                sql: `SELECT * FROM DIRECCION WHERE idDireccion = :id`,
                params: {
                    id: id
                }
            }
        )
        data(null, results)
    }catch(e) {
        data(e, null)
    }
}

export const createAddress = async (data, result) => {
    const {idUsuario, departamento, municipio} = data
    try {
        const {results} = await connection.query(
            {
                sql: `INSERT INTO DIRECCION(idUsuario, idProducto, departamento, municipio) VALUES(:val1, NULL, :val2, :val3);`,
                params: {
                    val1: idUsuario,
                    val2: departamento,
                    val3: municipio
                }
            }
        )
        console.log(results)
        result(null, results)
    }catch(e) {
        result(e, null)
    }
}