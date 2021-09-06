import express from 'express';
import cors from 'cors';
import router from './routes.js';

const app = express();
const port = 80;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/api', router);

app.listen(port, console.log('Server running on port ' + port));

