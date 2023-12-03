const Members = require('../models/Members');
const PM = require('../models/PM');
const LogController = require('../controllers/LogController');

async function createMember(req,res){
    console.log(req.body);
    try{
        const member = await Members.create(req.body);
        res.status(201).json(member);
    }
    catch(err){
        LogController.createLog("MemberController.js","createMember",err.message);
        res.status(500).json({error: err.message});
    }
}
// it will return all the Members from Member table or document
async function getAllMembersWithDetails(req,res){
    try{
        const members = await Members.find().populate('user_id').exec();
        res.status(201).json(members);
    }
    catch(err){
        LogController.createLog("MemberController.js","getAllMembersWithDetails",err.message);
        res.status(500).json({error:err.message});
    }
}
// it will return all the Project Managers from pms table or document
async function getAllPMWithDetails(req,res){
    try{
        const pms = await PM.find().populate('user_id').exec();
        res.status(201).json(pms);
    }
    catch(err){
        LogController.createLog("MemberController.js","getAllPMWithDetails",err.message);
        res.status(500).json({error:err.message});
    }
}

async function updateMember(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body; // Extract updates from the request body
        const updatedMember = await Members.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedMember);
    } catch (err) {
        LogController.createLog("MemberController.js","updateMember",err.message);
        res.status(500).json({ error: err.message });
    }
}


async function deleteMember(req,res){
    try{
        const { id } = req.params;
        await Members.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        LogController.createLog("MemberController.js","deleteMember",err.message);
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createMember,
    getAllMembersWithDetails,
    getAllPMWithDetails,
    updateMember,
    deleteMember
};