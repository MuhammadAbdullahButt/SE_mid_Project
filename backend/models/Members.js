const mongoose = require('mongoose');

const memberSchema = mongoose.Schema({
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    name: String,
    DOB: date,
    CNIC: String,
    role: String,
    description: String,
    skills: String
},{timestamps: true});

module.exports = mongoose.model('Member',memberSchema)