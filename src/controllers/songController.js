import db from "../infra/db.js";

const getSongs = async (req, res) => {
  let { take, skip } = req.query;

  take = take ?? 10;
  skip = skip ?? 0;

  let songs = await db.getSongs();
  const result = songs.slice(skip, skip + (take - 1));
  console.log('songs', result.length);
  console.log('take', take);
  console.log('skip', skip);

  return res.json(result);
}

const createSong = async (req, res) => {
  const result = await db.insertSong(req.body);

  return res.json({ status: result ? 'ok' : 'error' });
}

export default {
  getSongs,
  createSong,
}