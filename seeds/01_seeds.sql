INSERT INTO users (name, email, password) 
VAlUES ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties(owner_id, title,description,thumbnail_photo_url,cover_photo_url,cost_per_night,parking_spaces,number_of_bathrooms,number_of_bedrooms,country,street,city,province,post_code,active)
VAlUES (1, 'Speed lamp', 'description', 'https://cdn2.iconfinder.com/data/icons/houses-cartoon-2/512/d323_3-512.png', 'https://png.pngtree.com/png-clipart/20200225/original/pngtree-house-vector-illustration-isolated-on-white-background-house-cartoon-house-clip-png-image_5261981.jpg', 599, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142',true),
(2, 'Blank corner', 'description', 'https://cdn2.iconfinder.com/data/icons/houses-cartoon-2/512/d323_3-512.png', 'https://png.pngtree.com/png-clipart/20200225/original/pngtree-house-vector-illustration-isolated-on-white-background-house-cartoon-house-clip-png-image_5261981.jpg', 466, 5, 4, 5, 'Canada', '99 Highway', 'Vancouver', 'BC', 'V3N9V4', true),
(3, 'Habit mix', 'description', 'https://cdn2.iconfinder.com/data/icons/houses-cartoon-2/512/d323_3-512.png','https://png.pngtree.com/png-clipart/20200225/original/pngtree-house-vector-illustration-isolated-on-white-background-house-cartoon-house-clip-png-image_5261981.jpg', 699, 3, 6, 5, 'Canada', '1 Highway', 'Halifax', 'NS', '998we2', true);
 
INSERT INTO reservations(start_date,end_date,property_id,guest_id)
VAlUES('2018-09-11', '2018-09-26', 2, 3),
('2019-01-04', '2019-02-01', 2, 2),
('2014-10-21', '2014-10-22', 1, 1);

INSERT INTO property_reviews(guest_id,property_id,reservation_id,rating,message)
VAlUES(3,2,4, 3, 'message'),
(2,2,5,5,'message'),
(1,1,6,4,'message');