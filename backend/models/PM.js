const mongoose = require('mongoose');

const PMSchema = mongoose.Schema({
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    name: String,
    DOB: String,
    CNIC: String,
},{timestamps: true});

module.exports = mongoose.model('PM',PMSchema)