const mongoose = require('mongoose');

const commentSchema = mongoose.Schema({

    task_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Task'
    },
    author_name: String,
    text: String,
},{timestamps: true});

module.exports = mongoose.model('Comment',commentSchema)