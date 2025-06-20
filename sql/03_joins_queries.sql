-- Event Attendance with Status
SELECT u.name AS user_name, e.event_name, a.status, a.registered_at
FROM attendance a
JOIN users u ON a.user_id = u.user_id
JOIN event e ON a.event_id = e.event_id;

-- Feedback with Ratings
SELECT u.name AS user_name, e.event_name, f.comments, f.rating
FROM feedback f
JOIN users u ON f.user_id = u.user_id
JOIN event e ON f.event_id = e.event_id;

-- Wishlist with Events
SELECT u.name AS user_name, e.event_name, w.added_on
FROM wishlist w
JOIN users u ON w.user_id = u.user_id
JOIN event e ON w.event_id = e.event_id;

-- Wishlist Not Registered
SELECT u.name AS user_name, e.event_name
FROM wishlist w
LEFT JOIN attendance a ON w.user_id = a.user_id AND w.event_id = a.event_id
JOIN users u ON w.user_id = u.user_id
JOIN event e ON w.event_id = e.event_id
WHERE a.attendance_id IS NULL;

-- Payments with Details
SELECT p.payment_id, u.name AS user_name, e.event_name, p.amount, p.payment_date
FROM payments p
JOIN users u ON p.user_id = u.user_id
JOIN event e ON p.event_id = e.event_id;