const mysql = require('mysql');
const { promisify }= require('util');

const { database } = require('./keys');

const pool = mysql.createPool(database);

/*pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.');
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has to many connections');
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused');
    }
  }

  if (connection) connection.release();
  console.log('DB is Connected');

  return;
});*/
var connString = 'mysql://root:1234@localhost/db_links?charset=utf8_general_ci&timezone=-0700';
 
var conn = mysql.createConnection(connString);
conn.connect(function(err) {
  if (err) throw err;
  console.log("Conectado a la base de datos!");
  return;
});
// Promisify Pool Querys
conn.query = promisify(conn.query);

module.exports = conn;