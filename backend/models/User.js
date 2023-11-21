const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    userName: String,
    userPassword: String,
},{timestamps: true});

module.exports = mongoose.model('User',userSchema)