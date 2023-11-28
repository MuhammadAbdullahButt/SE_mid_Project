const Task = require('../models/Task');
const Team = require('../models/Team');
const TaskAudit = require('../models/TaskAudit');

async function createTask(req,res){
    console.log(req.body);
    try{
        const task = await Task.create(req.body);
        const taskAuditData = new TaskAudit({
            oldData: {},
            newData: {
                Project_id: req.body.Project_id,
                title: req.body.title,
                description: req.body.description,
                priority: req.body.priority,
                status: req.body.status,
                deadLine: req.body.deadLine,
                assignedTeam_id: req.body.assignedTeam_id,
            },
            action: 'created',
        });
        await taskAuditData.save();
        res.status(201).json(task);
    }
    catch{
        res.status(500).json({error: err.message});
    }
}

async function getAllTasks(req,res){
    try{
        const tasks = await Task.find();
        res.status(201).json(tasks);
    }
    catch{
        res.status(500).json({error:err.message});
    }
}

async function getAllTasksOfMember(req, res) {
    try {
        const { id } = req.params;
        const teams = await Team.find({ member_id: id });
        const teamIds = teams.map(team => team._id);
        const tasks = await Task.find({ assignedTeam_id: { $in: teamIds } });
        res.status(200).json(tasks);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}

async function updateTask(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body;
        const updatedTask = await Task.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedTask);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


async function deleteTask(req,res){
    try{
        const { id } = req.params;
        const task = await Task.findOneAndDelete({ _id: id });
        const taskAuditData = new TaskAudit({
            oldData: {
                Project_id: task.Project_id,
                title: task.title,
                description: task.description,
                priority: task.priority,
                status: task.status,
                deadLine: task.deadLine,
                assignedTeam_id: task.assignedTeam_id,
            },
            newData: {},
            action: 'deleted',
        });
        await taskAuditData.save();
        res.sendStatus(201);
    }
    catch(err){
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createTask,
    getAllTasks,
    updateTask,
    deleteTask,
    getAllTasksOfMember
};