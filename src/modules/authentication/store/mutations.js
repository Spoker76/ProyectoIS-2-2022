export const loginUser = (state, {user, token}) => {

    if (token) {
        window.localStorage.setItem('token', token)
        window.localStorage.setItem('user', JSON.stringify(user))
        state.user = user
        state.token = token
    }

    state.status = 'authenticated'
}

export const logout = (state) => {
    state.token = null
    state.user = null
    state.status = 'not-authenticated'
    window.localStorage.removeItem('token')
    window.localStorage.removeItem('user')
}

