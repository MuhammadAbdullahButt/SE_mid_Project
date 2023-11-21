const mongoose = require('mongoose');
mongoose.set('strictQuery',true)

mongoose.connect('mongodb://127.0.0.1:27017/PMS',{
    useNewUrlParser:true,
    useUnifiedTopology: true
});
const db = mongoose.connection;
db.on('error',(err)=>{
    console.log('Failed to connect with db')
});

db.once('open',()=>{
    console.log('connected with db')
})