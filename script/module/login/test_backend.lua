function commit_test_register_1(committer)
    local user = {
    	username = "_testuser",
    	password = "_testpwd",
    	privileges = "verify"
    }
    committer(user)
end
