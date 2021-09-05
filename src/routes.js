import express from 'express';
import loginController from './controllers/loginController.js';
import signupController from './controllers/signupController.js';
import userController from './controllers/userController.js';

const router = express.Router();

//  *** CRIAR CONTA ***
router.post('/signup', signupController.signUp);


//  *** LOGIN ***
router.post('/login', loginController.login);


//  *** BUSCAR USUÁRIO PELO EMAIL ***
router.get('/user/:email', userController.getUserByEmail);

//  *** ATUALIZAR DADOS CADASTRAIS ***
router.put('/user/:id', userController.updateUserInfo);



export default router;