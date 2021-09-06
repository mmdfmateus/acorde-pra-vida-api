import db from "../infra/db.js";

const getSongs = async (req, res) => {
  let { take, skip } = req.query;

  take = take ?? 10;
  skip = skip ?? 0;

  let songs = await db.getSongs();
  const result = songs.slice(skip);
  result.length = take > result.length ? result.length : take;

  return res.json(result);
}

const getSongById = async (req, res) => {
  let { id } = req.params;

  if (!id) {
    return res.status(400).json({ error: "Id was not provided" });
  }

  let result = await db.getSongById(id);

  return res.json(result ?? {});
}

const createSong = async (req, res) => {
  const result = await db.insertSong(req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

const editSong = async (req, res) => {
  const { id } = req.params;
  const result = await db.updateSong(id, req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

export default {
  createSong,
  getSongs,
  getSongById,
  editSong,
}