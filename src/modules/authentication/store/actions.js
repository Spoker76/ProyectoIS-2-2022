import {apiRest} from '@/api/api.js'

export const signInUser = async ({commit}, user) => {
    const {email, password} = user

    console.log(email, password)
    try {
        const {data} = await apiRest.post('/login', {email, password})
        console.log(data)
        if (data.badCredentials) return {ok: false}
        commit('loginUser', {user: data.user ,token: data.token}) 
        return {ok: true}
    }catch(e) {
        console.log(e)
        return {ok: false, e}
    }
}

export const checkAuthentication = async ({commit}) => {
    const token = window.localStorage.getItem('token')

    if (!token) {
        commit('logout')
        return {ok: false}
    }

    return {ok: true}
}