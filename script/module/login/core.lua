dofile("./script/module/login/test_backend.lua")
function internal.initialize(commit_backends, query_backend)
    internal.backends = commit_backends
    internal.query_backend = query_backend
end
