const Members = require('../models/Members');

async function createMember(req,res){
    console.log(req.body);
    try{
        const member = await Members.create(req.body);
        res.status(201).json(member);
    }
    catch{
        res.status(500).json({error: err.message});
    }
}

async function getAllMembersWithDetails(req,res){
    try{
        const members = await Members.find().populate('user_id').exec();
        res.status(201).json(members);
    }
    catch{
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
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createMember,
    getAllMembersWithDetails,
    updateMember,
    deleteMember
};