const Team = require('../models/Team');
const LogController = require('../controllers/LogController');

// this function will create a team after given the title and members id
async function createTeam(req,res){
    console.log(req.body);
    try{
        req.body.member_id = JSON.parse(req.body.member_id);
        const team = await Team.create(req.body);
        res.status(201).json(team);
    }
    catch(err){
        LogController.createLog("TeamController.js","createTeam",err.message);
        res.status(500).json({error: err.message});
    }
}
// this function will return all teams
async function getAllTeams(req,res){
    try{
        const teams = await Team.find();
        console.log(teams);
        res.status(201).json(teams);
    }
    catch(err){
        LogController.createLog("TeamController.js","getAllTeams",err.message);
        res.status(500).json({error:err.message});
    }
}

//this function will return team details of a specific member
async function getTeamByMemberId(req, res) {
    try {
        const { id } = req.params;
        const teams = await Team.find({ member_id: id });
        res.status(200).json(teams);
    } catch (err) {
        LogController.createLog("TeamController.js","getTeamByMemberId",err.message);
        res.status(500).json({ error: err.message });
    }
}


async function updateTeams(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body;
        const updatedTeam = await Project.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedTeam);
    } catch (err) {
        LogController.createLog("TeamController.js","updateTeams",err.message);
        res.status(500).json({ error: err.message });
    }
}

// this function will delete the team after given the team id
async function deleteTeam(req,res){
    try{
        const { id } = req.params;
        await Team.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        LogController.createLog("TeamController.js","deleteTeam",err.message);
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