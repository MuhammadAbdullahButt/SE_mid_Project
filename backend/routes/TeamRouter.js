const express = require('express');
const router = express.Router();
const TeamController = require('../controllers/TeamController');


router.post('/create',TeamController.createTeam);
router.get('/view',TeamController.getAllTeams);
router.put('/update/:id',TeamController.updateTeams);
router.delete('/delete/:id',TeamController.deleteTeam);

module.exports = router;