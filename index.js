import express from 'express'
import cors from 'cors'
import { tryConn } from './config/dbConfig.js'
import { router } from './router/routes.js'


const port = process.env.PORT || 3000
const app = express()

app.use(express.json())

app.use(cors())

app.use(router)

tryConn()

app.listen(port, () => {
    console.log(`Server is up on port ${port}`)
})