import { connection } from "../config/dbConfig.js";

export const getUserInfo = async (id, data) => {

    try {

        const {results} = await connection.query({sql: `SELECT USUARIO.idUsuario AS ID,primerNombre AS PNOMBRE,segundoNombre AS SNOMBRE, primerApellido AS PAPELLIDO,segundoApellido AS SAPELLIDO,correo AS CORREO, telefono AS TELEFONO,pass AS CONTRASEÑA,DIRECCION.departamento AS DEPARTAMENTO, DIRECCION.municipio AS MUNICIPIO,AVG(CALIFICACION.calificacion) AS PROMEDIOCAL, foto AS FOTO FROM USUARIO LEFT JOIN DIRECCION ON USUARIO.idUsuario = DIRECCION.idUsuario LEFT JOIN CALIFICACION ON USUARIO.idUsuario = CALIFICACION.receptor WHERE USUARIO.idUsuario = :id`, params: {id: id}})
        data(null, results)

    }catch(e) {

        data(e, null)

    }
}

export const getUserSubs = async (id, data) => {

    try {

        const {results} = await connection.query({sql: `SELECT idCategoria AS SUSCRIPCIONES FROM SUSCRIPCION WHERE idUsuario = :id`, params: {id: id}})
        data(null, results)

    }catch(e) {

        data(e, null)

    }
}