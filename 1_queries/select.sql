SELECT id, name, email, password
FROM users
WHERE email = 'tristanjacobs@gmail.com';

SELECT avg(end_date - start_date) AS average_duration
FROM reservations;

SELECT properties.*, avg(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;

SELECT properties.city AS city, count(reservations.*) AS total_reservations
FROM properties
JOIN reservations ON properties.id = property_id
GROUP BY properties.city
ORDER BY total_reservations DESC;

SELECT reservations.*, properties.*, avg(rating)
FROM reservations
JOIN properties ON properties.id = property_id
JOIN users ON users.id = guest_id
JOIN property_reviews ON reservations.id = reservation_id
WHERE end_date != now()::date
GROUP BY reservations.id, properties.id
ORDER BY start_date
LIMIT 10;

SELECT properties.*, reservations.*, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id 
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;
