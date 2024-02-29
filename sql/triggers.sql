--1
CREATE
OR REPLACE FUNCTION prevent_duplicate_album() RETURNS TRIGGER AS $ $ BEGIN -- Check if an album with the same name already exists
IF EXISTS (
    SELECT
        1
    FROM
        album
    WHERE
        name = NEW.name
) THEN RAISE EXCEPTION 'An album with the same name already exists';

END IF;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER check_duplicate_album BEFORE
INSERT
    ON album FOR EACH ROW EXECUTE FUNCTION prevent_duplicate_album();

--2
CREATE
OR REPLACE FUNCTION prevent_duplicate_album() RETURNS TRIGGER AS $ $ BEGIN -- Check if an album with the same name already exists
IF EXISTS (
    SELECT
        1
    FROM
        album
    WHERE
        album_name = NEW.album_name
) THEN RAISE EXCEPTION 'An album with the same name already exists';

END IF;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER check_duplicate_album BEFORE
INSERT
    ON album FOR EACH ROW EXECUTE FUNCTION prevent_duplicate_album();

--user_db triggers
--3
--password cant be the same
CREATE
OR REPLACE FUNCTION check_password_update() RETURNS TRIGGER AS $ $ BEGIN IF NEW.password = OLD.password THEN RAISE EXCEPTION 'New password must be different from the previous password';

END IF;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER before_update_password BEFORE
UPDATE
    ON user_db FOR EACH ROW
    WHEN (NEW.password IS NOT NULL) EXECUTE FUNCTION check_password_update();

--4
--username cant be the same
CREATE
OR REPLACE FUNCTION prevent_username_reuse() RETURNS TRIGGER AS $ $ BEGIN IF NEW.username = OLD.username THEN RAISE EXCEPTION 'New username cannot be the same as the previous username';

END IF;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER check_username_reuse BEFORE
UPDATE
    OF username ON user_db FOR EACH ROW EXECUTE FUNCTION prevent_username_reuse();

--when any review is added to the reviews table, the song popularity is also updated then.