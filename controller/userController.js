import { getUsers, getUserById, createUser, trylogIn } from "../model/userModel.js"

export const showUsers = (_, res) => {
    getUsers((error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const showUserById = (req, res) => {
    getUserById(req.params.id, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const insertUser = (req, res) => {
    createUser(req.body, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const login = (req, res) => {
    trylogIn(req.body, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}