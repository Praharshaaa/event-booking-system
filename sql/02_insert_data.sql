USE event_booking;

INSERT INTO users (name, email) VALUES
('Harsha', 'harsha@mail.com'),
('Ravi', 'ravi123@mail.com'),
('Swathi', 'swathi@mail.com');

INSERT INTO event (event_name, event_date) VALUES
('SQL Workshop', '2025-06-15'),
('Python Meetup', '2025-07-10'),
('AI Conference', '2025-08-01');

INSERT INTO attendance (user_id, event_id, status) VALUES
(1, 2, 'Present'),
(2, 1, 'Absent'),
(3, 3, 'Present');

INSERT INTO feedback (user_id, event_id, comments, rating) VALUES
(1, 2, 'Great session on Python!', 5),
(2, 1, 'Very informative SQL workshop.', 4),
(3, 3, 'AI Conference was average.', 3);

INSERT INTO wishlist (user_id, event_id) VALUES
(1, 1), (1, 2), (3, 2);

INSERT INTO payments (user_id, event_id, amount) VALUES
(1, 2, 100.00),
(2, 1, 150.00),
(3, 3, 50.00);