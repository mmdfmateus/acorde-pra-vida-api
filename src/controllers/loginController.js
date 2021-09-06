import db from "../infra/db.js";
import cryptoService from "../services/cryptoService.js";
import jwtService from "../services/jwtService.js";

export const login = async (req, res) => {
  // let { email, password } = req.body;

  const user = await db.getUserByEmail(req.body.email)
  if (user == undefined) {
    return res.status(403).json({ error: 'Invalid credentials provided' });
  }

  const isAuthenticated = await cryptoService.compare(req.body.password, user.password);
  if (!isAuthenticated) {
    return res.status(403).json({ error: 'Invalid credentials provided' });
  }

  const authToken = jwtService.generate(user.userId);
  const success = await db.updateUserAccessToken(user.userId, authToken);

  const { password, ...userWithoutPassword } = user
  return res.json({ status: success ? 'ok' : 'error', user: { ...userWithoutPassword, authToken} });
}

export const logout = async (req, res) => {
  const { id } = req.params;

  const success = await db.revokeUserAccessToken(id);

  return res.json({ status: success ? 'ok' : 'error' });
}

export default {
  login,
  logout
}