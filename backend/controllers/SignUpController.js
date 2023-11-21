const Member = require('../models/Members');
const projectManager = require('../models/PM');
const User = require('../models/User');

async function SignUpMember(req, res) {
    console.log(req.body);

    try {
        const { username, password } = req.body;
        const user = await User.create({ username, password });
        const userId = user._id;
        req.body.user_id = userId;
        const member = await Member.create(req.body);
        res.status(201).json(member);
    } 
    catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error' });
    }
}


async function SignUpPM(req,res){
    try {
        const { username, password } = req.body;
        const user = await User.create({ username, password });
        const userId = user._id;
        req.body.user_id = userId;
        const PM = await projectManager.create(req.body);
        res.status(201).json(PM);
    } 
    catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error' });
    }
}

module.exports={
    SignUpMember,
    SignUpPM,
};