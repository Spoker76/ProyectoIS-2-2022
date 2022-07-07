import mysql from 'mysql'
import { MySQL } from 'mysql-promisify'

const newConn = mysql.createConnection({
    host: 'localhost',
    user: 'root', 
    password: 'josuepadilla',
    database: 'DB_PROYECTO_INS',
})

export const tryConn = () => newConn.connect((err) => {
    if (err) {
        console.log(`Can't connect to database! ${err}`)
        return
    }else {
        console.log('Connected successfully to database')
    }
})

export const connection = new MySQL({
    host: 'localhost',
    user: 'root',
    password: 'josuepadilla',
    database: 'DB_PROYECTO_INS',
    timeout: 60000,
    charset: 'utf8'
})