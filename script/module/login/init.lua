local using_mysql = (server.stats_use_mysql == 1)
if using_mysql then
	commit_backends.mysql = dofile("./script/module/login/mysql.lua")
	catch_error(commit_backends.mysql.open, {
		hostname    = server.stats_mysql_hostname,
		port        = server.stats_mysql_port,
		username    = server.stats_mysql_username,
		password    = server.stats_mysql_password,
		database    = server.stats_mysql_database,
		schema      = "./script/module/login/mysql_schema.sql",
		triggers    = "./script/module/login/mysql_triggers.sql",
		install     = server.stats_mysql_install == "true",
		servername  = server.stats_servername
	})
end
