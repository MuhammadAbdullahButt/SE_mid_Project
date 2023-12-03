const Member = require('../models/Members');
const projectManager = require('../models/PM');
const User = require('../models/User');
const LogController = require('../controllers/LogController');

// this function will creates a user and member object and stores them in to respective tables
// Member table will contain the user_id
async function SignUpMember(req, res) {
    try {
        const { username, password, role } = req.body;
        const user = await User.create({ username, password, role });
        const userId = user._id;
        req.body.user_id = userId;
        const member = await Member.create(req.body);
        res.status(201).json(member);
    } 
    catch (error) {
        LogController.createLog("SignUpController.js","SignUpMember",error.message);
        res.status(500).json({ error: error.message });
    }
}


// this function will creates a user and project manager object and stores them in to respective tables
// project manager table will contain the user_id
async function SignUpPM(req,res){
    try {
        const { username, password, role } = req.body;
        const user = await User.create({ username, password, role });
        const userId = user._id;
        req.body.user_id = userId;
        const PM = await projectManager.create(req.body);
        res.status(201).json(PM);
    } 
    catch (error) {
        LogController.createLog("SignUpController.js","SignUpPM",error.message);
        res.status(500).json({ error: error.message });
    }
}

// this function will return the object if the user is present
async function Login(req, res) {
    try {
        const { username, password } = req.body;
        const user = await User.findOne({ username });
        if (!user) {
            return res.status(401).json({ error: 'Invalid username or password' });
        }
        if(user.password != password)
        {
            return res.status(401).json({ error: 'Invalid username or password' });
        }
        if(user.role == 'project manager'){
            const pmData = await projectManager.findOne({ user_id: user._id });
            if (!pmData) {
                return res.status(404).json({ error: 'Data not found for project manager' });
            }
            res.status(200).json({
                userName: username,
                role: 'project manager',
                data: pmData
            });
        }
        else{
            const memberData = await Member.findOne({ user_id: user._id });
            if (!memberData) {
                return res.status(404).json({ error: 'Data not found for member' });
            }
            res.status(200).json({
                userName: username,
                role: user.role,
                data: memberData
            });
            
    }
    } catch (error) {
        LogController.createLog("SignUpController.js","Login",error.message);
        res.status(500).json({ error: error.message });
    }
}

module.exports={
    SignUpMember,
    SignUpPM,
    Login
};