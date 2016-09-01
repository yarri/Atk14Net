CREATE TABLE sessions(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        security VARCHAR(255) NOT NULL,
        session_name VARCHAR(255) NOT NULL,
        remote_addr VARCHAR(255) NOT NULL,
        created DATETIME,
        last_access DATETIME
);
CREATE INDEX in_sessions_lastaccess ON sessions (last_access);

CREATE TABLE session_values(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
        session_id INT NOT NULL,
        section VARCHAR(255) NOT NULL,
        `key` VARCHAR(255) NOT NULL,
        value TEXT,
        expiration DATETIME,
        CONSTRAINT fk_sessionvalues_sessions FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX unq_sessionvalues ON session_values(session_id,section,`key`);
CREATE INDEX in_sessionvalues_sessionid ON session_values(session_id);
CREATE INDEX in_sessionvalues_expiration ON session_values(expiration);

