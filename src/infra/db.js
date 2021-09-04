import mysql from 'mysql';
import { uuid } from 'uuidv4';

const db = mysql.createPool({
  // configuração de acesso
  host: '127.0.0.1',
  database: 'AcordePraVida',
  user: 'root',
  password: '123456',
  port: 3306,

  // configuração das conexões
  multipleStatements: true,

  // configuração da pool
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});



const users = [];

const insertUser = (user) => {
  try {
    const sqlInsertUser = "INSERT INTO user (userId, isEmailConfirmed, email, password, name, authToken, roleId) VALUES (NULL, true, ?, ?, ?, NULL, 2)"
    
    db.query(sqlInsertUser, [ user.email, user.hashedPassword, user.name], (error,result)=>{
      console.log(result);
      console.log(error);
      return result;
    });
  } catch (error) {
    console.error(error);
  }




  // IMPLEMENTAÇÃO COM ARRAY, PQ NAO CONSEGUI CONECTAR COM O BD
  // users.push({ id: uuid(), ...user });
  // console.log(users);
}

const getUserByEmail = (email) => {
  try {
    const sqlGetUser = "SELECT * FROM user WHERE email = ?";
    
    db.query(sqlGetUser, [ email ], (error,result)=>{
      console.log(result);
      console.log(error);
      return result;
    });
  } catch (error) {
    console.error(error);
  }


  // IMPLEMENTAÇÃO COM ARRAY, PQ NAO CONSEGUI CONECTAR COM O BD
  // console.log(users);
  // return users.find(user => user.email == email);
}

const updateUserAccessToken = (userId, accessToken) => {

  try {
    const sqlInsertUser = "UPDATE user  SET (userId, isEmailConfirmed, email, password, name, authToken, roleId) VALUES (NULL, true, ?, ?, ?, NULL, 2)"
    
    db.query(sqlInsertUser, [ user.email, user.hashedPassword, user.name], (error,result)=>{
      console.log(result);
      console.log(error);
      return result;
    });
  } catch (error) {
    console.error(error);
  }


  // IMPLEMENTAÇÃO COM ARRAY, PQ NAO CONSEGUI CONECTAR COM O BD
  const user = users.find(user => user.id == userId);
  const index = users.findIndex(user => user.id == userId);

  const updatedUser = {  ...user, accessToken };
  console.log(`updating user on index ${index} to value ${JSON.stringify(updatedUser)}`);
  users[index] = updatedUser;
  console.log(users);
}

export default {
  insertUser,
  getUserByEmail,
  updateUserAccessToken,
}