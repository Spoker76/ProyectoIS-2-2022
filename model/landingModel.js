import { connection } from "../config/dbConfig.js";

export const getTopCategories  = async (data) => {

    try {
        const {results} = await connection.query({sql: `SELECT CATEGORIA.idCategoria AS ID,CATEGORIA.nombre AS CATEGORIA,COUNT(PRODUCTO.idCategoria) AS VENTAS, FOTOCAT.image AS FOTO FROM VENTAS INNER JOIN PRODUCTO ON VENTAS.idProducto = PRODUCTO.idProducto INNER JOIN CATEGORIA ON PRODUCTO.idCategoria = CATEGORIA.idCategoria INNER JOIN FOTOCAT ON CATEGORIA.idCategoria = FOTOCAT.idCategoria GROUP BY PRODUCTO.idCategoria ORDER BY VENTAS DESC LIMIT 3;`})
        data(null, results)

    } catch(e) {

        data(e, null)  
              
    }
}

export const getProductsResume  = async (data) => {

    try {
        const {results} = await connection.query({sql: `SELECT PRODUCTO.idProducto AS ID,PRODUCTO.nombre AS NOMBRE,image AS FOTO,FORMAT(costo, 2, 'de_DE') AS PRECIO,CATEGORIA.nombre 
        AS CATEGORIA FROM PRODUCTO INNER JOIN CATEGORIA ON PRODUCTO.idCategoria = CATEGORIA.idCategoria INNER JOIN FOTO ON 
        PRODUCTO.idProducto = FOTO.idProducto WHERE activo = True ORDER BY fecha DESC LIMIT 8;`})
        data(null, results)

    } catch(e) {

        data(e, null)  
              
    }
}