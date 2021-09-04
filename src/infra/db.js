import { connect } from './conn.js';


const insertUser = async (user) => {
  try {
    const conn = await connect();
    const sqlInsertUser = "INSERT INTO user (userId, isEmailConfirmed, email, password, name, authToken, roleId) VALUES (NULL, true, ?, ?, ?, NULL, 2)"
    await conn.query(sqlInsertUser, [ user.email, user.hashedPassword, user.name]);
    
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

const getUserByEmail = async (email) => {
  try {
    const conn = await connect();
    const sqlGetUser = "SELECT * FROM user WHERE email = ?";
    const result = await conn.query(sqlGetUser, [ email ]);

    // console.log(result[0]);
    return result[0][0] ?? undefined;
    
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

const updateUserAccessToken = async (userId, accessToken) => {
  try {
    const conn = await connect();
    const sqlInsertUser = "UPDATE user SET authToken=? WHERE userId=?"
    
    const result = await conn.query(sqlInsertUser, [ accessToken, userId ]);
    return true;
  } catch (error) {
    console.error(error);
    return false;
  }
}

export default {
  insertUser,
  getUserByEmail,
  updateUserAccessToken,
}