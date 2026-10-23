-- Soru 1
SELECT title FROM event WHERE capacity > 50;

-- Soru 2
SELECT m.full_name, e.title 
FROM member m 
JOIN event_registration er ON m.member_id = er.member_id 
JOIN event e ON er.event_id = e.event_id;

-- Soru 3
SELECT DISTINCT m.full_name 
FROM member m 
JOIN event_registration er ON m.member_id = er.member_id 
JOIN event e ON er.event_id = e.event_id 
JOIN club c ON e.club_id = c.club_id 
WHERE c.club_name = 'Yazilim Kulubu'
UNION
SELECT DISTINCT m.full_name 
FROM member m 
JOIN event_registration er ON m.member_id = er.member_id 
JOIN event e ON er.event_id = e.event_id 
JOIN club c ON e.club_id = c.club_id 
WHERE c.club_name = 'Dans Kulubu';

-- Soru 4
SELECT full_name FROM member
EXCEPT
SELECT m.full_name FROM member m JOIN event_registration er ON m.member_id = er.member_id;

-- Soru 5
SELECT m1.full_name AS uye_1, m2.full_name AS uye_2, m1.age 
FROM member m1 
JOIN member m2 ON m1.age = m2.age AND m1.member_id < m2.member_id;

-- Soru 6
SELECT m.full_name 
FROM member m 
WHERE NOT EXISTS (
    SELECT e.event_id FROM event e
    EXCEPT
    SELECT er.event_id FROM event_registration er WHERE er.member_id = m.member_id
);
