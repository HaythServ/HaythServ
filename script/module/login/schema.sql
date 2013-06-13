CREATE TABLE IF NOT EXISTS logins
	username		TEXT DEFAULT "",
	password		TEXT DEFAULT ""
);
CREATE INDEX IF NOT EXISTS "login_username" ON logins (username);
CREATE INDEX IF NOT EXISTS "login_password" ON logins (password);
