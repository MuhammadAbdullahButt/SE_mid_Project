const express = require('express');
const router = express.Router();
const UserController = require('../controllers/UserController');
const MemberController = require('../controllers/MemberController');


router.post('/create',UserController.createUser);
router.get('/view',UserController.getAllUsers);
router.put('/update/:id',UserController.updateUser);
router.delete('/delete/:id',UserController.deleteUser);
router.get('/members',MemberController.getAllMembersWithDetails);
router.get('/pm',MemberController.getAllPMWithDetails);

module.exports = router;