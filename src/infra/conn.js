import mysql from 'mysql2/promise';

export const connect = async () => {
  if(global.connection && global.connection.state !== 'disconnected') {
    return global.connection;
  }

  const connection = await mysql.createConnection("mysql://root:123456@localhost:3306/AcordePraVida");
  console.log("Conectou no MySQL!");
  global.connection = connection;
  return connection;
}