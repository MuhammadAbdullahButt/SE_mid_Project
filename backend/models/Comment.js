const mongoose = require('mongoose');

const commentSchema = mongoose.Schema({
    //the task id of task in which it is commented
    task_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Task'
    },
    author_name: String,
    text: String,
},{timestamps: true});

module.exports = mongoose.model('Comment',commentSchema)