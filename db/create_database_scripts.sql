use tip_database;

-- Think about constraints - DEFAULT and CHECK

-- Users table
CREATE TABLE IF NOT EXISTS users (
	user_id INTEGER NOT NULL,
	email_address VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(80) NOT NULL,
	user_name VARCHAR(50) UNIQUE DEFAULT NULL,
	join_date TIMESTAMP NOT NULL,
	last_login DATETIME NOT NULL,
	status INTEGER NOT NULL,
    description VARCHAR(200) DEFAULT NULL,
    PRIMARY KEY(user_id)
);


-- Contacts table
CREATE TABLE IF NOT EXISTS contacts (
	connection_user_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    contact_additional_name VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(connection_user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);



-- Coversation table
CREATE TABLE IF NOT EXISTS coversation (
	conversation_id INTEGER NOT NULL,
    connection_user_id INTEGER NOT NULL,
    sender_ip VARCHAR(15),
    recipier_id VARCHAR(15),
    start_date_and_time DATETIME NOT NULL,
    stop_date_and_time DATETIME NOT NULL,
    PRIMARY KEY (conversation_id),
    FOREIGN KEY (connection_user_id) REFERENCES contacts(connection_user_id)
);



-- Users_converstions table
CREATE TABLE IF NOT EXISTS users_coversations (
	connect_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    conversation_id INTEGER NOT NULL,
    PRIMARY KEY (connect_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(conversation_id) REFERENCES users(user_id)
);