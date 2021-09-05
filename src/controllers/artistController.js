import db from "../infra/db.js";

const createArtist = async (req, res) => {
  const result = await db.insertArtist(req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

const editArtist = async (req, res) => {
  const { id } = req.params;
  const result = await db.updateArtist(id, req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

export default {
  createArtist,
  editArtist,
}