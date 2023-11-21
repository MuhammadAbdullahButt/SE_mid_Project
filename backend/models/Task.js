const mongoose = require('mongoose');

const taskSchema = mongoose.Schema({
    Project_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Project'
    },
    title: String,
    description: String,
    priority: String,
    status: String,
    deadLine: Date,
    assignedTeam_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Team'
    },
},{timestamps: true});

module.exports = mongoose.model('Task',taskSchema)