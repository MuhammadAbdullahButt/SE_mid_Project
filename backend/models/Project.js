const mongoose = require('mongoose');

const projectSchema = mongoose.Schema({
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
},{timestamps: true});

module.exports = mongoose.model('Project',projectSchema)