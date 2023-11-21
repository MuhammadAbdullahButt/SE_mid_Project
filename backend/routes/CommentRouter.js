const express = require('express');
const router = express.Router();
const commentController = require('../controllers/CommentController');


router.post('/create',commentController.createComment);
router.get('/view',commentController.getAllComments);
router.put('/update/:id',commentController.updateComment);
router.delete('/delete/:id',commentController.deleteComment);

module.exports = router;