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


CREATE OR REPLACE FUNCTION get_user_growth() RETURNS DECIMAL
AS $$
DECLARE
    new_users_count INTEGER;
    old_users_count INTEGER;
    total_users_count INTEGER;
    growth DECIMAL;
BEGIN
    SELECT COUNT(*) INTO total_users_count
    FROM user_db;

    SELECT COUNT(*) INTO new_users_count
    FROM user_db
    WHERE created_on >= CURRENT_DATE - INTERVAL '30 days';

    old_users_count := total_users_count - new_users_count;

    growth := (total_users_count - old_users_count) / total_users_count * 100;
    RETURN growth;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_purchase_growth() RETURNS DECIMAL
AS $$
DECLARE
    new_purchases_count INTEGER;
    old_purchases_count INTEGER;
    total_purchases_count INTEGER;
    growth DECIMAL;
BEGIN
    SELECT COUNT(*) INTO total_purchases_count
    FROM purchase_history;

    SELECT COUNT(*) INTO new_purchases_count
    FROM purchase_history
    WHERE purchase_date >= CURRENT_DATE - INTERVAL '30 days';

    old_purchases_count := total_purchases_count - new_purchases_count;

    IF total_purchases_count = 0 THEN
        RETURN 0;
    ELSE
        growth := (total_purchases_count - old_purchases_count) / total_purchases_count * 100;
        RETURN growth;
    END IF;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_review_growth() RETURNS DECIMAL
AS $$
DECLARE
    new_reviews_count INTEGER;
    old_reviews_count INTEGER;
    total_reviews_count INTEGER;
    growth DECIMAL;
BEGIN
    SELECT COUNT(*) INTO total_reviews_count
    FROM reviews;

    SELECT COUNT(*) INTO new_reviews_count
    FROM reviews
    WHERE review_date >= CURRENT_DATE - INTERVAL '30 days';

    old_reviews_count := total_reviews_count - new_reviews_count;
    IF total_reviews_count = 0 THEN
        RETURN 0;
    ELSE
        growth := (total_reviews_count - old_reviews_count) / total_reviews_count * 100;
        RETURN growth;
    END IF;
END;
$$ LANGUAGE plpgsql;
