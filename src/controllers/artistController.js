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

const getArtists = async (req, res) => {
  let { take, skip } = req.query;

  take = take ?? 10;
  skip = skip ?? 0;

  let artists = await db.getArtists();
  const total = artists.length;
  const result = artists.slice(skip);
  result.length = take > result.length ? result.length : take;

  return res.json({ count: total, items: result });
}

const getArtistById = async (req, res) => {
  let { id } = req.params;

  if (!id) {
    return res.status(400).json({ error: "Id was not provided" });
  }

  let result = await db.getArtistById(id);

  return res.json(result ?? {});
}

export default {
  createArtist,
  editArtist,
  getArtists,
  getArtistById,
}