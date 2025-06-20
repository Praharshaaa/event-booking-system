DELIMITER $$
CREATE TRIGGER check_event_capacity
BEFORE INSERT ON attendance
FOR EACH ROW
BEGIN
    DECLARE current_count INT;
    DECLARE event_cap INT;

    SELECT COUNT(*) INTO current_count FROM attendance WHERE event_id = NEW.event_id;
    SELECT capacity INTO event_cap FROM event WHERE event_id = NEW.event_id;

    IF current_count >= event_cap THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registration failed: Event is already full';
    END IF;
END $$
DELIMITER ;