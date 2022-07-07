import { getUserInfo,getUserSubs } from "../model/profileModel.js"

export const showProfileInformationById = (req, res) => {
    getUserInfo(req.params.id, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}

export const showSubscriptionsById = (req, res) => {
    getUserSubs(req.params.id, (error, results) => {
        if (error) {
            res.send(error)
        }else {
            res.json(results)
        }
    })
}