import express from 'express';
import cors from 'cors';
import db from './infra/db.js';
import cryptoService from './services/cryptoService.js';
import jwtService from './services/jwtService.js';

const app = express();
const port = 5501;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.post('/api/signup', async (req, res) => {
  const { name, email, emailConfirmation, password } = req.body;

  if (email != emailConfirmation) {
    return res.status(400).json({ error: 'Email is not equal to email confirmation' });
  }

  if (await db.getUserByEmail(email)) {
    return res.status(400).json({ error: 'Email is already in use' });
  }
  
  const hashedPassword = await cryptoService.encrypt(password);

  const user = {
    name,
    email,
    hashedPassword
  }

  const success = await db.insertUser(user);

  return res.json({ status: success ? 'ok' : 'error' });
})

app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;

  const user = await db.getUserByEmail(email)
  if (user == undefined) {
    return res.status(403).json({ error: 'Invalid credentials provided' });
  }

  const isAuthenticated = await cryptoService.compare(password, user.password);
  if (!isAuthenticated) {
    return res.status(403).json({ error: 'Invalid credentials provided' });
  }

  const authToken = jwtService.generate(user.userId);
  const success = await db.updateUserAccessToken(user.userId, authToken);

  return res.json({status: success ? 'ok' : 'error', authToken });
});

app.get('/api/user/:email', async (req, res) => {
  const { email } = req.params;

  const user = await db.getUserByEmail(email);
  console.log('user', user);

  return res.json({ status: 'ok', user });
})

app.listen(port, console.log('Server running on port ' + port));

