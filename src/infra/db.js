import { connect } from './conn.js';


const insertUser = async (user) => {
  try {
    const conn = await connect();
    const sqlQuery = "INSERT INTO user (userId, isEmailConfirmed, email, password, name, authToken, roleId) VALUES (NULL, true, ?, ?, ?, NULL, 2)"
    await conn.query(sqlQuery, [ user.email, user.hashedPassword, user.name]);
    
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

const getUserByEmail = async (email) => {
  try {
    const conn = await connect();
    const sqlQuery = "SELECT * FROM user WHERE email = ?";
    const result = await conn.query(sqlQuery, [ email ]);

    // console.log(result[0]);
    return result[0][0] ?? undefined;
    
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

const updateUserInfo = async (id, email, password) => {
  try {
    const conn = await connect();
    let values = [ id ];
    let emailUpdate = '';
    let passwordUpdate = '';
    
    if (password) {
      passwordUpdate = 'password=?';
      values.unshift(password);
    }

    if (email) {
      emailUpdate = 'email=?';
      values.unshift(email);
    }

    const comma = email && password ? ', ' : '';

    const sqlQuery = `UPDATE user SET ${emailUpdate} ${comma} ${passwordUpdate} WHERE userId=?`;
    const result = await conn.query(sqlQuery, values);

    return true;
    
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

const updateUserAccessToken = async (userId, accessToken) => {
  try {
    const conn = await connect();
    const sqlQuery = "UPDATE user SET authToken=? WHERE userId=?"
    
    const result = await conn.query(sqlQuery, [ accessToken, userId ]);
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

const getSongs = async () => {
  try {
    const conn = await connect();
    // const sqlQuery = `select * from song limit ? offset ?`;
    const sqlQuery = `select * from song`;
    
    const result = await conn.query(sqlQuery);
    console.log('result', result[0]);

    return result[0];
  } catch (error) {
    console.error(error);
    return false;
  }
}

const getSongById = async (id) => {
  try {
    const conn = await connect();
    const sqlQuery = `select * from song where songId = ?`;
    
    const result = await conn.query(sqlQuery, [ id ]);

    return result[0][0];
  } catch (error) {
    console.error(error);
    return false;
  }
}

const insertSong = async ({ name, artistId, userId, content, level, genre, videoUrl }) => {
  try {
    const conn = await connect();
    const sqlQuery = "INSERT INTO song (songId, name, content, level, views, videoUrl, genre, userId, artistId, rating) VALUES (NULL, ?, ?, ?, 0, ?, ?, ?, ?, 0)"
    await conn.query(sqlQuery, [ name, content, level, videoUrl, genre, userId, artistId ]);
    
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

const updateSong = async (id, data) => {
  try {
    const conn = await connect();
    let updateString = '';
    
    Object.keys(data).forEach(key => {
      // if it is an INT on database, it can't have ""
      if (key == 'artistId' || key == 'userId=' || key == 'level=' || key == 'rating') {
        updateString += `${key}=${data[key]}, `
      } else {
        updateString += `${key}="${data[key]}", `
      }
    });

    // remove the last comma
    updateString = updateString.replace(/,([^,]*)$/, '$1');

    const sqlQuery = `UPDATE song SET ${updateString} WHERE songId=${id}`;
    const result = await conn.query(sqlQuery);

    return true;
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

const insertArtist = async ({ name, genre, photoUrl }) => {
  try {
    const conn = await connect();
    const sqlQuery = "INSERT INTO artist (artistId, name, views, photoUrl, genre, rating) VALUES (NULL, ?, 0, ?, ?, 0)"
    await conn.query(sqlQuery, [ name, photoUrl, genre ]);
    
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

const updateArtist = async (id, data) => {
  try {
    const conn = await connect();
    let updateString = '';
    
    Object.keys(data).forEach(key => {
      // if it is an INT on database, it can't have ""
      if (key == 'views' || key == 'rating=') {
        updateString += `${key}=${data[key]}, `
      } else {
        updateString += `${key}="${data[key]}", `
      }
    });

    // remove the last comma
    updateString = updateString.replace(/,([^,]*)$/, '$1');

    const sqlQuery = `UPDATE artist SET ${updateString} WHERE artistId=${id}`;
    const result = await conn.query(sqlQuery);

    return true;
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

export default {
  /* USER */
  insertUser,
  getUserByEmail,
  updateUserAccessToken,
  updateUserInfo,

  /* SONGS */
  getSongs,
  getSongById,
  insertSong,
  updateSong,

  /* ARTISTS */
  insertArtist,
  updateArtist,
}