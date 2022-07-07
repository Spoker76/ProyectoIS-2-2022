import {getAddresses, getAddressById, createAddress} from "../model/addressModel.js";

export const showAddresses = (_, res) => {
    getAddresses((error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const showAddressById = (req, res) => {
    getAddressById(req.params.id, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const insertAddress = (req, res) => {
    createAddress(req.body, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}