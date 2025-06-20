-- Events with Capacity and Remaining Seats
SELECT e.event_name, e.capacity,
       COUNT(a.attendance_id) AS registered_count,
       (e.capacity - COUNT(a.attendance_id)) AS remaining_seats
FROM event e
LEFT JOIN attendance a ON e.event_id = a.event_id
GROUP BY e.event_id;

-- Most Popular Event
SELECT e.event_name, COUNT(a.attendance_id) AS total_attendance
FROM event e
JOIN attendance a ON e.event_id = a.event_id
WHERE a.status = 'Present'
GROUP BY e.event_id
ORDER BY total_attendance DESC
LIMIT 1;

-- Events in the Future
SELECT event_name, event_date
FROM event
WHERE event_date > CURDATE();

-- Average Rating per Event
SELECT e.event_name, ROUND(AVG(f.rating), 2) AS average_rating
FROM feedback f
JOIN event e ON f.event_id = e.event_id
GROUP BY f.event_id, e.event_name
ORDER BY average_rating DESC;

-- Events that reached capacity
SELECT e.event_name, e.capacity, COUNT(a.attendance_id) AS registered_count
FROM event e
LEFT JOIN attendance a ON e.event_id = a.event_id
GROUP BY e.event_id
HAVING registered_count >= e.capacity;