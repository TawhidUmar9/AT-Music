CREATE TABLE change_log (
    log_id SERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    column_name VARCHAR(255),
    operation VARCHAR(10) NOT NULL,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);