const Project = require('../models/Project');
const Task = require('../models/Task');
const ProjectAudit = require('../models/ProjectAudit');

async function createProject(req,res){
    console.log(req.body);
    try{
        const project = await Project.create(req.body);
        const projectAuditData = new ProjectAudit({
            oldData: {},
            newData: {
                pm_id: req.body.pm_id,
                name: req.body.name,
                type: req.body.type,
                description: req.body.description,
                cost: req.body.cost,
                status: req.body.status,
                repoLink: req.body.repoLink,
                deadLine: req.body.deadLine,
            },
            action: 'created',
        });
        await projectAuditData.save();
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


async function getProjectsByPmId(req, res) {
    try {
        const userId = req.params.id;
        const projects = await Project.find({ pm_id: userId });
        res.status(201).json(projects);
    } catch (err) {
        res.status(500).json({ error: err.message });
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
        await Task.deleteMany({ Project_id: id });
        const projectt = await Project.findOneAndDelete({ id: id });
        const projectAuditData = new ProjectAudit({
            oldData: {
                pm_id: projectt.pm_id,
                name: projectt.name,
                type: projectt.type,
                description: projectt.description,
                cost: projectt.cost,
                status: projectt.status,
                repoLink: projectt.repoLink,
                deadLine: projectt.deadLine,
            },
            newData: {},
            action: 'deleted',
        });
        await projectAuditData.save();
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
    getAllProjects,
    getProjectsByPmId
};