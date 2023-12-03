const User = require('../models/User');
const Member = require('../models//Members');
const PM = require('../models/PM');
const LogController = require('./LogController');


// this function will create a user after given the username, password and role
async function createUser(req,res){
    console.log(req.body);
    try{
        const user = await User.create(req.body);
        res.status(201).json(user);
    }
    catch(err){
        LogController.createLog("UserController.js","createUser",err.message);
        res.status(500).json({error: err.message});
    }
}

// this function will return all users
async function getAllUsers(req,res){
    try{
        const users = await User.find();
        res.status(201).json(users);
    }
    catch(err){
        LogController.createLog("UserController.js","getAllUsers",err.message);
        res.status(500).json({error:err.message});
    }
}

// this function will update user after given the details
async function updateUser(req, res) {
    try {
        const { id } = req.params;
        const updates = req.body; // Extract updates from the request body
        const updatedUser = await User.findOneAndUpdate({ id: id }, updates, { new: true });
        
        res.status(201).json(updatedUser);
    } catch (err) {
        LogController.createLog("UserController.js","updateUser",err.message);
        res.status(500).json({ error: err.message });
    }
}

// this function will delete the user after given the id
async function deleteUser(req,res){
    try{
        const { id } = req.params;
        await User.findOneAndRemove({ id: id });
        res.sendStatus(201);
    }
    catch(err){
        LogController.createLog("UserController.js","deleteUser",err.message);
        res.status(500).json({error: err.message});
    }
}

//this function will return all the users
async function getAllUsersWithDetails(req,res) {
    try {
        const Members = await Member.find();
        const pm = await PM.find();
        res.status(200).json([Members,pm]);
    } catch (err) {
        LogController.createLog("UserController.js","getAllUsersWithDetails",err.message);
        res.status(500).json({error: err.message});
    }
}
module.exports={
    createUser,
    getAllUsersWithDetails,
    updateUser,
    deleteUser,
    getAllUsers
};