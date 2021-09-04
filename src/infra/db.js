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
  // const sqlInsertUser = "INSERT INTO usuario (usuarioid,ativo,email,emailconfirmado,senha,nome,funcaoid) VALUES (NULL,true,?,true,?,?,2)";

  // db.query();




  // IMPLEMENTAÇÃO COM ARRAY, PQ NAO CONSEGUI CONECTAR COM O BD
  users.push({ id: uuid(), ...user });
  console.log(users);
}

const getUserByEmail = (email) => {




  // IMPLEMENTAÇÃO COM ARRAY, PQ NAO CONSEGUI CONECTAR COM O BD
  console.log(users);
  return users.find(user => user.email == email);
}

const updateUserAccessToken = (userId, accessToken) => {




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