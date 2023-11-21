const User = require('../models/User');

async function createUser(req,res){
    console.log(req.body);
    try{
        const user = await User.create(req.body);
        res.status(201).json(user);
    }
    catch{
        res.status(500).json({error: err.message});
    }
}

async function getAllUsers(req,res){
    try{
        const users = await User.find();
        res.status(201).json(users);
    }
    catch{
        res.status(500).json({error:err.message});
    }
}

async function updateUser(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body; // Extract updates from the request body
        const updatedUser = await User.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedUser);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}


async function deleteUser(req,res){
    try{
        const { id } = req.params;
        await User.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        res.status(500).json({error: err.message});
    }
}

module.exports={
    createUser,
    getAllUsers,
    updateUser,
    deleteUser
};