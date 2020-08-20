const properties = require('./json/properties.json');
const users = require('./json/users.json');
const pg = require('pg')
const Client = pg.Client;

const options = {
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
};

const client = new Client(options);
client.connect(() => {
  console.log('connected to the db')
})


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return client.query(`
  SELECT * FROM users
  WHERE email = $1
  `, [email])
  .then(res => {
    console.log(res.rows)
    return res.rows[0];
  }).catch(()=> null);
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return client.query(`
  SELECT id FROM users
  WHERE id = $1
  `, [id])
  .then(res => {
    return res.rows[0].id
  }).catch(()=>null)
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return client.query(
    `INSERT INTO users(name, email, password)
     VALUES ($1, $2, $3)
     RETURNING *;
     `, [user.name, user.email, user.password]
  ).then(res => {
    return res.rows[0];
  })
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return getAllProperties(null, 2);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  return client.query(`
  SELECT * FROM properties
  LIMIT $1
  `, [limit])
  .then(res => {
    return res.rows
  });
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
