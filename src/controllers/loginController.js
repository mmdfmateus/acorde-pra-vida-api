import db from "../infra/db.js";
import cryptoService from "../services/cryptoService.js";
import jwtService from "../services/jwtService.js";

export const login = async (req, res) => {
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

  return res.json({ status: success ? 'ok' : 'error', id: user.userId, authToken });
}

export default {
  login
}