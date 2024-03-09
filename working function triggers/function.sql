CREATE OR REPLACE FUNCTION set_default_popularity() RETURNS TRIGGER 
AS $$
BEGIN
    UPDATE
        song
    SET
        popularity = 0
    WHERE
        song_id = NEW.song_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION prevent_username_reuse() RETURNS TRIGGER 
AS $$ 
BEGIN 
    IF NEW.username = OLD.username
    AND NEW.email = OLD.email
    AND NEW.phone_number = OLD.phone_number THEN 
        RAISE EXCEPTION 
            'Username, email, and phone number must be different from the previous values';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION check_password_update() RETURNS TRIGGER 
AS $$ 
BEGIN 
    IF NEW.password = OLD.password THEN 
        RAISE EXCEPTION 'New password must be different from the previous password';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION hash_password(input_text TEXT) RETURNS TEXT 
AS $$
BEGIN
    RETURN md5(input_text);
END;
$$ LANGUAGE plpgsql;



