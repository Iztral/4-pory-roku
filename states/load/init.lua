return {
    init = function(self)
        lily.newFont("assets/font/caviarDreams.ttf", 32):onComplete(function(_, font)
            assets.font.caviarDreams_32 = font

            local assetsDirectories = lf.getDirectoryItems("assets")

            local assetsFilesPaths = {}

            lume.each(assetsDirectories, function(directory)
                local assetsPaths = lf.getDirectoryItems("assets/" .. directory)

                lume.each(assetsPaths, function(assetPath)
                    table.insert(assetsFilesPaths, string.format("%s/%s", directory, assetPath))
                end)
            end)

            local assetsFilesInfo = lume.map(assetsFilesPaths, function(assetsFilePath)
                return lume.array(assetsFilePath:gmatch("[^%.]+"))
            end)

            local assetsMultililyInfo = lume.map(assetsFilesInfo, function(info)
                local directoryName = lume.split(info[1], "/")
                local extension = info[2]

                local directory = directoryName[1]
                local name = directoryName[2]

                local assetFullPath = string.format("assets/%s/%s.%s", directory, name, extension)

                local loadArguments, loadObjectInfo

                if lume.find({ "jpg", "png" }, extension) ~= nil then
                    loadArguments = {{ "newImage", assetFullPath }}
                    loadObjectInfo = {{ name, extension, directory }}
                elseif lume.find({ "mp3", "ogg" }, extension) ~= nil then
                    loadArguments = {{ "newSource", assetFullPath, "stream" }}
                    loadObjectInfo = {{ name, extension, directory }}
                elseif lume.find({ "ttf" }, extension) ~= nil then
                    loadArguments, loadObjectInfo = {}, {}
                    for size = 16, 128, 8 do
                        table.insert(loadArguments, { "newFont", assetFullPath, size })
                        table.insert(loadObjectInfo, { name, extension, directory })
                    end
                else
                    error(string.format("Invalid format: %s", extension))
                end

                return { loadArguments = loadArguments, loadObjectInfo = loadObjectInfo }
            end)

            assetsMultililyInfo = lume.filter(assetsMultililyInfo, function(info) return info ~= nil end)

            local assetsInfoFlat, assetsNamesFlat = {}, {}

            lume.each(assetsMultililyInfo, function(infoArray)
                lume.each(infoArray.loadArguments, function(info)
                    table.insert(assetsInfoFlat, info)
                end)
                lume.each(infoArray.loadObjectInfo, function(info)
                    table.insert(assetsNamesFlat, info)
                end)
            end)

            self.multilily = lily.loadMulti(assetsInfoFlat)

            self.multilily:onComplete(function(_, objects)
                for k, v in pairs(objects) do
                    local obj = v[1]

                    local suffix = ""

                    if obj:type() == "Font" then
                        suffix = string.format("_%d", lume.last(assetsInfoFlat[k]))
                    end

                    local newKey = assetsNamesFlat[k][1] .. suffix

                    local directory = assetsNamesFlat[k][3]

                    if not assets[directory] then
                        assets[directory] = {}
                    end

                    assets[directory][newKey] = v[1]
                end

                -- loading all states
                local statesNames = lf.getDirectoryItems("states")
                lume.remove(statesNames, "load")
                lume.each(statesNames, function(stateName)
                    states[stateName] = require("states." .. stateName)
                end)

                timer.after(0.25, function()
                    gamestate.switch(states.stateswitcher, self, states.splash)
                end)
            end)
        end)
    end,

    draw = require "states.load.draw",
    update = require "states.load.update",
}
