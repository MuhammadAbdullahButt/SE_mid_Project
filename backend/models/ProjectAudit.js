const mongoose = require('mongoose');

const projectAuditSchema = mongoose.Schema({
    //Old data refers to the Project Object that is being deleted or updated
    oldData: {
        type: mongoose.Schema.Types.Mixed, 
    },
    //new data refers to the Project Object that is newly created
    newData: {
        type: mongoose.Schema.Types.Mixed, 
    },
    //action will be either of created,deleted,updated
    action: String,
    createdBy: String

},{timestamps: true});

module.exports = mongoose.model('ProjectAudit',projectAuditSchema)