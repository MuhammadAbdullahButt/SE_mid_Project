const mongoose = require('mongoose');

const projectSchema = mongoose.Schema({
    name: String,
    type: String,
    description: String,
    cost: String,
    status: String,
    repoLink: String,
    deadLine: Date,
},{timestamps: true});

module.exports = mongoose.model('Project',projectSchema)