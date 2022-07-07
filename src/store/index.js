import { createStore } from "vuex";
import authModule from '@/modules/authentication/store'

const store = createStore({
    modules: {
        authModule
    }
})

export default store