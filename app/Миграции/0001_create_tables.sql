CREATE TABLE IF NOT EXISTS users (
    id         BIGINT PRIMARY KEY,
    first_name VARCHAR(64)  NOT NULL,
    last_name  VARCHAR(64)  NOT NULL,
    username   VARCHAR(32)  UNIQUE,
    photo_url  TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS exchanges (
    id                   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                 VARCHAR(128) NOT NULL,
    admin_id             BIGINT       NOT NULL,
    place                TEXT,
    money                NUMERIC(12, 2),
    distribution_date    DATE,
    swap_date            DATE,
    is_selected_gifters  BOOLEAN      NOT NULL DEFAULT false,
    is_ended             BOOLEAN      NOT NULL DEFAULT false,
    icon                 TEXT         NOT NULL DEFAULT '',
    gifters              TEXT
);

CREATE TABLE IF NOT EXISTS exchange_members (
    exchange_id BIGINT      NOT NULL REFERENCES exchanges(id) ON DELETE CASCADE,
    user_id     BIGINT      NOT NULL REFERENCES users(id),
    joined_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (exchange_id, user_id)
);

CREATE INDEX IF NOT EXISTS exchange_members_user_idx ON exchange_members (user_id);
