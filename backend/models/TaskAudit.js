const mongoose = require('mongoose');

const taskAuditSchema = mongoose.Schema({
    oldData: {
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
    },
    newData: {
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
    },
    action: String

},{timestamps: true});

module.exports = mongoose.model('TaskAudit',taskAuditSchema)