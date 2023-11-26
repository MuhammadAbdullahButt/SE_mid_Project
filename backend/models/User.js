const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    username: String,
    password: String,
    role: String
},{timestamps: true});

module.exports = mongoose.model('User',userSchema)