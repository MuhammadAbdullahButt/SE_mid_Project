const mongoose = require('mongoose');

const commentSchema = mongoose.Schema({
    author_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Member'
    },
    text: String,
    commentedAt: timestamps
},{timestamps: true});

module.exports = mongoose.model('Comment',commentSchema)