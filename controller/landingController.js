import { getTopCategories, getProductsResume } from "../model/landingModel.js"

export const sendTopCategories = (_, res) => {
    getTopCategories((error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const sendProductsResume = (_, res) => {
    getProductsResume((error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}