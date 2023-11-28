const mongoose = require('mongoose');

const projectAuditSchema = mongoose.Schema({
    oldData: {
        pm_id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'PM'
        },
        name: String,
        type: String,
        description: String,
        cost: String,
        status: String,
        repoLink: String,
        deadLine: String,
    },
    newData: {
        pm_id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'PM'
        },
        name: String,
        type: String,
        description: String,
        cost: String,
        status: String,
        repoLink: String,
        deadLine: String,

    },
    action: String

},{timestamps: true});

module.exports = mongoose.model('ProjectAudit',projectAuditSchema)