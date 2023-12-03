const mongoose = require('mongoose');

const logSchema = mongoose.Schema({

    file_name: String,
    function_name:String,
    error_text: String,
},{timestamps: true});

module.exports = mongoose.model('Logs',logSchema)