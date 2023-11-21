const express = require('express');
const router = express.Router();
const UserController = require('../controllers/UserController');


router.post('/create',UserController.createUser);
router.get('/view',UserController.getAllUsers);
router.put('/update/:id',UserController.updateUser);
router.delete('/delete/:id',UserController.deleteUser);

module.exports = router;