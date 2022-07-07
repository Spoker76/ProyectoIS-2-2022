import express, { Router } from 'express'
import { insertAddress, showAddressById, showAddresses } from '../controller/addressController.js'
import { insertUser, login, showUserById, showUsers } from '../controller/userController.js'
import { sendTopCategories, sendProductsResume } from '../controller/landingController.js'
import { showProfileInformationById, showSubscriptionsById} from '../controller/profileController.js'


export const router = express.Router()

router.post('/login', login)

router.get('/users', showUsers)

router.post('/users/create', insertUser)

router.get('/users/:id', showUserById)

router.get('/addresses', showAddresses)

router.post('/addresses/create', insertAddress)

router.get('/addresses/:id', showAddressById)

/*Para la LANDING PAGE*/

router.get('/categories/top',sendTopCategories)

router.get('/products/resume',sendProductsResume)

/*Para la PROFILE PAGE*/

router.get('/profileInformation/user/:id',showProfileInformationById)

router.get('/profileSubscriptions/user/:id',showSubscriptionsById)