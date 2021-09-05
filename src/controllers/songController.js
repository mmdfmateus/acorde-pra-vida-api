import db from "../infra/db.js";

const getSongs = async (req, res) => {
  const { take, skip } = req.params;

  const songs = await db.getSongs(skip, take);
  console.log('songs', songs);

  return res.json(songs);
}

const createSong = async (req, res) => {
  const result = await db.insertSong(req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

export default {
  getSongs,
  createSong,
}