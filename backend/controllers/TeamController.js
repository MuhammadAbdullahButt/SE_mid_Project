const Team = require('../models/Team');

async function createTeam(req,res){
    console.log(req.body);
    try{
        req.body.member_id = JSON.parse(req.body.member_id);
        const team = await Team.create(req.body);
        res.status(201).json(team);
    }
    catch(err){
        console.log(err.message);
        res.status(500).json({error: err.message});
    }
}

async function getAllTeams(req,res){
    try{
        const teams = await Team.find();
        console.log(teams);
        res.status(201).json(teams);
    }
    catch{
        res.status(500).json({error:err.message});
    }
}

async function getTeamByMemberId(req, res) {
    try {
        const { id } = req.params;
        // Assuming id is the member_id you want to use for filtering
        const teams = await Team.find({ member_id: id });
        res.status(200).json(teams);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


async function updateTeams(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body; // Extract updates from the request body
        const updatedTeam = await Project.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedTeam);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


async function deleteTeam(req,res){
    try{
        const { id } = req.params;
        await Team.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createTeam,
    getAllTeams,
    updateTeams,
    deleteTeam,
    getTeamByMemberId
};