import mysql from 'mysql2/promise';

export const connect = async () => {
  if(global.connection && global.connection.state !== 'disconnected') {
    return global.connection;
  }

  const connection = await mysql.createConnection("mysql://doadmin:_UZo057IjqsC6XtG@db-mysql-nyc3-12291-do-user-9801588-0.b.db.ondigitalocean.com:25060/AcordePraVida?ssl-mode=REQUIRED");
  console.log("Conectou no MySQL!");
  global.connection = connection;
  return connection;
}