import express from 'express';
import artistController from './controllers/artistController.js';
import loginController from './controllers/loginController.js';
import signupController from './controllers/signupController.js';
import songController from './controllers/songController.js';
import userController from './controllers/userController.js';

const router = express.Router();

//  *** CRIAR CONTA ***
router.post('/signup', signupController.signUp);


//  *** LOGIN ***
router.post('/login', loginController.login);


//  *** BUSCAR USUÁRIO PELO EMAIL ***
router.get('/users/:email', userController.getUserByEmail);

//  *** ATUALIZAR DADOS CADASTRAIS ***
router.put('/users/:id', userController.updateUserInfo);


//  *** BUSCAR MÚSICAS ***
router.get('/songs', songController.getSongs);

//  *** BUSCAR MÚSICA PELO ID ***
router.get('/songs/:id', songController.getSongById);

//  *** CRIAR MÚSICA ***
router.post('/songs', songController.createSong);

//  *** EDITAR MÚSICA ***
router.put('/songs/:id', songController.editSong);



//  *** CRIAR ARTISTA ***
router.post('/artists', artistController.createArtist);

//  *** EDITAR ARTISTA ***
router.put('/artists/:id', artistController.editArtist);

export default router;