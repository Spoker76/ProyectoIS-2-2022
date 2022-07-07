import store from "@/store"

export const isAuthenticatedGuard =  async (to, from, next) => {
    const {ok} = await store.dispatch('authModule/checkAuthentication')
    console.log('ok in guard', ok)
    if (ok) next()
    else next({name: 'login'})
}

