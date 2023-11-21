const express = require('express');
const router = express.Router();
const ProjectController = require('../controllers/ProjectController');


router.post('/create',ProjectController.createProject);
router.get('/view',ProjectController.getAllProjects);
router.put('/update/:id',ProjectController.updateProject);
router.delete('/delete/:id',ProjectController.deleteProject);

module.exports = router;