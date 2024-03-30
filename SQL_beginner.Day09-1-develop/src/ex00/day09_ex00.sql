CREATE TABLE person_audit (
    created timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    type_event char(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
BEGIN
IF (TG_OP = 'INSERT') THEN
    INSERT INTO
        person_audit
    SELECT
        CURRENT_TIMESTAMP,
        'I',
        NEW.*;
END IF;
RETURN NEW;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER
INSERT
    ON person
FOR EACH ROW 
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO 
    person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');


