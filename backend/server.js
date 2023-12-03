const bodyParser = require('body-parser')
const express = require('express')
const db = require('./utils/db')
const projectRouter = require('./routes/ProjectRouter')
const taskRouter = require('./routes/TaskRouter')
const teamRouter = require('./routes/TeamRouter')
const signUpRouter = require('./routes/SignUpRouter')
const commentRouter = require('./routes/CommentRouter')
const userRouter = require('./routes/UserRouter')

const app  = express()

//  middlewares
app.use(bodyParser.json());
app.use(
    express.urlencoded({
      extended: true,
    })
  );

  
// routes
app.use('/project',projectRouter);
app.use('/task',taskRouter);
app.use('/team',teamRouter);
app.use('/signup',signUpRouter);
app.use('/login',signUpRouter);
app.use('/user',userRouter);
app.use('/comment',commentRouter);


app.listen(3005,()=>{
    console.log('Server is listening on port 3005')
})