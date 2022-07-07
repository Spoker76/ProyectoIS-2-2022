import bcryptjs from 'bcryptjs'

export const encryptPass = async (pass) => {
    const encryptedPass = await bcryptjs.hash(pass, 10)
    return encryptedPass
}

export const comparePass = async (pass, savedPass) => {
    const result = await bcryptjs.compare(pass, savedPass)
    return result
}