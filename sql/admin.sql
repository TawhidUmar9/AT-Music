CREATE TABLE IF NOT EXISTS admin (
    admin_id BIGSERIAL PRIMARY KEY NOT NULL,
    admin_name VARCHAR(50) NOT NULL UNIQUE,
    admin_password VARCHAR(50) NOT NULL
);

INSERT INTO
    admin (admin_name, admin_password)
VALUES
    ('aranna', 'aranna1'),
    ('tonmoy', 'tonmoy2');