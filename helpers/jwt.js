import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'

dotenv.config()

export const generateToken = (element) => {
    return jwt.sign(element, process.env.ACCESS_SECRET_TOKEN)
}

export const generateRefreshToken = (element) => {
    return jwt.sign(element, process.env.REFRESH_SECRET_TOKEN)
}

export const verifyToken = (element) => {
    return jwt.verify(element, process.env.ACCESS_SECRET_TOKEN)
}