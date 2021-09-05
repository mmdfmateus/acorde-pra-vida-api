import db from "../infra/db.js";
import cryptoService from "../services/cryptoService.js";

const getUserByEmail = async (req, res) => {
  const { email } = req.params;

  const { password, ...user } = await db.getUserByEmail(email);
  console.log('user', user);

  return res.json({ status: 'ok', user });
}

const updateUserInfo = async (req, res) => {
  const { id } = req.params;
  let { email, password } = req.body;

  if (password) {
    password = await cryptoService.encrypt(password);
  }

  const success = await db.updateUserInfo(id, email, password);
  // console.log('user', user);

  return res.json({ status: success ? 'ok' : 'error' });
}

export default {
  getUserByEmail,
  updateUserInfo,
}