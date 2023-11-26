const express = require('express');
const router = express.Router();
const signUpController = require('../controllers/SignUpController');


router.post('/member',signUpController.SignUpMember);
router.post('/pm',signUpController.SignUpPM);
router.post('/user',signUpController.Login);

module.exports = router;