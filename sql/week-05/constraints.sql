ALTER TABLE member ALTER COLUMN email SET NOT NULL;
ALTER TABLE event ALTER COLUMN status SET NOT NULL;

ALTER TABLE event_registration 
    ADD CONSTRAINT uq_registration_member_event UNIQUE (member_id, event_id);

ALTER TABLE club 
    ADD CONSTRAINT uq_club_name UNIQUE (club_name);

ALTER TABLE event 
    ADD CONSTRAINT chk_event_capacity_rating CHECK (capacity > 0 AND rating BETWEEN 1 AND 5);

ALTER TABLE event 
    ADD CONSTRAINT chk_event_status CHECK (status IN ('active', 'suspended', 'closed'));

ALTER TABLE event 
    ADD CONSTRAINT chk_event_date_order CHECK (end_date >= start_date);

ALTER TABLE event 
    DROP CONSTRAINT IF EXISTS event_club_id_fkey,
    ADD CONSTRAINT fk_event_club FOREIGN KEY (club_id) REFERENCES club(club_id);

ALTER TABLE event_registration 
    DROP CONSTRAINT IF EXISTS event_registration_member_id_fkey,
    ADD CONSTRAINT fk_registration_member FOREIGN KEY (member_id) REFERENCES member(member_id);

ALTER TABLE event_registration 
    DROP CONSTRAINT IF EXISTS event_registration_event_id_fkey,
    ADD CONSTRAINT fk_registration_event FOREIGN KEY (event_id) REFERENCES event(event_id);
