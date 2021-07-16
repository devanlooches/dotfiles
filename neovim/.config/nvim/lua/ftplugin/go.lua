return function()
    require('funcs.dedterm').setup{
        run_cmd = "go run",
        test_cmd = "go test",
    }
end
