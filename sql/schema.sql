DROP TABLE IF EXISTS event_registration CASCADE;
DROP TABLE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS club CASCADE;
DROP TABLE IF EXISTS member CASCADE;

CREATE TABLE club (
    club_id SERIAL PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);

CREATE TABLE member (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    age INT
);

CREATE TABLE event (
    event_id SERIAL PRIMARY KEY,
    club_id INT REFERENCES club(club_id),
    title VARCHAR(150) NOT NULL,
    capacity INT,
    rating INT,
    status VARCHAR(20),
    start_date DATE,
    end_date DATE
);

CREATE TABLE event_registration (
    registration_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES member(member_id),
    event_id INT REFERENCES event(event_id),
    registration_date DATE
);
