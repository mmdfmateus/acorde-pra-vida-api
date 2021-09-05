import db from "../infra/db.js";
import cryptoService from "../services/cryptoService.js";

const signUp = async (req, res) => {
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
}

export default {
  signUp
}