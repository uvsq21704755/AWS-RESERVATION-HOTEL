const express = require('express');
const app = express();

require('./Config/db_config')

const clientModel = require('./Routes/client_route');

app.use('/', clientModel);
app.listen(5500, ()=> console.log('Server lance'));