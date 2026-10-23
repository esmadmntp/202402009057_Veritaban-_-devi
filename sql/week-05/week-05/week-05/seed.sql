TRUNCATE TABLE event_registration, event, club, member RESTART IDENTITY CASCADE;

INSERT INTO club (club_name, category) VALUES 
('Yazilim Kulubu', 'Teknoloji'),
('Dans Kulubu', 'Sanat'),
('Veri Bilimi', 'Akademik');

INSERT INTO member (full_name, email, age) VALUES 
('Esma Dumantepe', 'esma@dogus.edu.tr', 20),
('Ahmet Yilmaz', 'ahmet@dogus.edu.tr', 21),
('Zeynep Kaya', 'zeynep@dogus.edu.tr', 22),
('Mehmet Demir', 'mehmet@dogus.edu.tr', 19),
('Ayse Celik', 'ayse@dogus.edu.tr', 23);

INSERT INTO event (club_id, title, capacity, rating, status, start_date, end_date) VALUES 
(1, 'Python Workshop', 60, 5, 'active', '2026-04-10', '2026-04-10'),
(1, 'SQL ve Veritabani', 40, 4, 'active', '2026-04-15', '2026-04-15'),
(2, 'Salsa Gecesi', 30, 5, 'active', '2026-05-01', '2026-05-01'),
(3, 'Machine Learning Giris', 10, 4, 'active', '2026-05-10', '2026-05-10');

INSERT INTO event_registration (member_id, event_id, registration_date) VALUES 
(1, 1, '2026-04-01'),
(1, 3, '2026-04-02'),
(2, 1, '2026-04-01'),
(3, 2, '2026-04-03'),
(4, 4, '2026-04-04');
