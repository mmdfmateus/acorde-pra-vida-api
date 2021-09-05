import db from "../infra/db.js";

const createArtist = async (req, res) => {
  const result = await db.insertArtist(req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

export default {
  createArtist,
}