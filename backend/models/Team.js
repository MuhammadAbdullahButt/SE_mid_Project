const mongoose = require('mongoose');

const teamSchema = mongoose.Schema({
    title: String,
    member_id:[{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Member'
    }]
},{timestamps: true});

module.exports = mongoose.model('Team',teamSchema)