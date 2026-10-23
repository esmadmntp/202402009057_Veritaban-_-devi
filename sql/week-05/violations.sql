\set VERBOSITY verbose

TRUNCATE TABLE event_registration, event, club, member RESTART IDENTITY CASCADE;

INSERT INTO club (club_id, club_name, category) VALUES (1, 'Yazilim Kulubu', 'Teknoloji');
INSERT INTO member (member_id, full_name, email, age) VALUES (1, 'Esma Dumantepe', 'esma@dogus.edu.tr', 20);
INSERT INTO event (event_id, club_id, title, capacity, rating, status, start_date, end_date) 
VALUES (1, 1, 'Python Workshop', 50, 5, 'active', '2026-04-10', '2026-04-10');

-- TEST 01: NOT NULL İhlali
INSERT INTO member (full_name, email, age) VALUES ('Ahmet Yilmaz', NULL, 22);

-- TEST 02: UNIQUE İhlali
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (1, 1, '2026-04-01');
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (1, 1, '2026-04-02');

-- TEST 03: CHECK İhlali (Tarih)
INSERT INTO event (event_id, club_id, title, capacity, rating, status, start_date, end_date) 
VALUES (2, 1, 'Hata Testi', 30, 4, 'active', '2026-05-10', '2026-05-05');

-- TEST 04: CHECK İhlali (Kapasite)
INSERT INTO event (event_id, club_id, title, capacity, rating, status, start_date, end_date) 
VALUES (3, 1, 'Kapasite Testi', 0, 3, 'active', '2026-06-01', '2026-06-01');

-- TEST 05: CHECK İhlali (Status)
INSERT INTO event (event_id, club_id, title, capacity, rating, status, start_date, end_date) 
VALUES (4, 1, 'Status Testi', 20, 4, 'unknown_status', '2026-06-01', '2026-06-01');

-- TEST 06: FOREIGN KEY İhlali (Olmayan kulüp ID)
INSERT INTO event (event_id, club_id, title, capacity, rating, status, start_date, end_date) 
VALUES (5, 999, 'Olmayan Kulup', 20, 4, 'active', '2026-06-01', '2026-06-01');

-- TEST 07: FOREIGN KEY İhlali (Restrict silme testi)
DELETE FROM club WHERE club_id = 1;
