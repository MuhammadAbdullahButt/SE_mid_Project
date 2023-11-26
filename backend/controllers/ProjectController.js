const Project = require('../models/Project');

async function createProject(req,res){
    console.log(req.body);
    try{
        const project = await Project.create(req.body);
        res.status(201).json(project);
    }
    catch{
        res.status(500).json({error: 'error'});
    }
}

async function getAllProjects(req,res){
    try{
        const projects = await Project.find();
        res.status(201).json(projects);
    }
    catch{
        res.status(500).json({error:err.message});
    }
}

async function updateProject(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body; // Extract updates from the request body
        const updatedProject = await Project.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedProject);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


async function deleteProject(req,res){
    try{
        const { id } = req.params;
        await Project.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createProject,
    deleteProject,
    updateProject,
    getAllProjects
};