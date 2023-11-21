const express = require('express');
const router = express.Router();
const memberController = require('../controllers/MemberController');


router.post('/create',memberController.createMember);
router.get('/view',memberController.getAllMembers);
router.put('/update/:id',memberController.updateMember);
router.delete('/delete/:id',memberController.deleteMember);

module.exports = router;