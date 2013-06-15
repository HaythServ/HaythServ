local using_mysql = (server.stats_use_mysql == 1)
if using_mysql then
	catch_error(dofile("./script/module/login/mysql.lua"), {
		hostname    = server.stats_mysql_hostname,
		port        = server.stats_mysql_port,
		username    = server.stats_mysql_username,
		password    = server.stats_mysql_password,
		database    = server.stats_mysql_database,
		schema      = "./script/module/login/schema.sql",
		install     = server.stats_mysql_install == "true",
		servername  = server.stats_servername
	})
end
