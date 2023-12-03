const Log = require('../models/Log')



async function createLog(file_name, function_name, error_text){
        const data = await Log.create({
            file_name: file_name,
            function_name: function_name,
            error_text: error_text
        });
}

module.exports = {
    createLog,
}