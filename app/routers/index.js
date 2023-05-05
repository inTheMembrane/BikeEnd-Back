// Importation des dépendances
const express = require('express');
const router = express.Router();

// Importation des controllers
const {userController, loginController, signupController} = require('../controllers')

// On préfixe les routers
// get /user/:id pour récupere les infos du user connecté et 
// patch /user/:id pour modifier des infos du user connecté
// delete /user/:id pour supprimer le user
// id est précontrollé avec d+ en regex
router.route('/user/:id(\\d+)')
.get(userController.getOne)
.patch(userController.update)
.delete(userController.delete)
// post /login pour s'enregistrer'
router.post('/login', authentificationController.login);
// post /signup pour créer un compte
router.post('/signup', authentificationController.signup);

module.exports = router;

