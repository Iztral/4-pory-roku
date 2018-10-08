function love.conf(t)
    t.version = "11.1"

    t.window.title = "4 pory"
    t.window.fullscreen = true
    t.window.fullscreenType = "desktop"
    t.releases = {
        title = "4pory",
        package = "4pory",
        loveVersion = "11.1",
        version = "1.0.0",
        author = "To-pory",
        email = nil,
        description = "A game",
        homepage = nil,
        identifier = nil,
        compile = true,
        excludeFileList = {"_OLD", "TODO.md", "README.md", ".git", ".gitattributes"},
        releaseDirectory = "../4pory-release",
    }
end
