return {
    init = function(self)
        lily.newFont("assets/font/caviarDreams.ttf", 32):onComplete(function(_, font)
            assets.font.caviarDreams_32 = font

            local assetsFilesPaths = lf.getDirectoryItems("assets")

            assetsFilesPaths = lume.filter(assetsFilePaths, function(assetsFilePath)
                return lf.getInfo("assets/" .. assetsFilePath, "directory") ~= nil
            end)

            local assetsFilesInfo = lume.map(assetsFilesPaths, function(assetsFilePath)
                return lume.array(assetsFilePath:gmatch("[^%.]+"))
            end)

            local assetsMultililyInfo = lume.map(assetsFilesInfo, function(info)
                local name = info[1]
                local extension = info[2]

                local assetFullPath = string.format("assets/%s.%s", name, extension)

                local loadArguments, loadObjectInfo

                if lume.find({ "jpg", "png" }, extension) ~= nil then
                    loadArguments = {{ "newImage", assetFullPath }}
                    loadObjectInfo = {{ name, extension }}
                elseif lume.find({ "mp3", "ogg" }, extension) ~= nil then
                    loadArguments = {{ "newSource", assetFullPath, "stream" }}
                    loadObjectInfo = {{ name, extension }}
                elseif lume.find({ "ttf" }, extension) ~= nil then
                    loadArguments, loadObjectInfo = {}, {}
                    for size = 16, 64, 8 do
                        table.insert(loadArguments, { "newFont", assetFullPath, size })
                        table.insert(loadObjectInfo, { name, extension })
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
                    assets[newKey] = v[1]
                end

                Timer.after(0.25, function()
                    Gamestate.switch(states.menu)
                end)
            end)
        end)
    end,

    draw = require "states.load.draw",
    update = require "states.load.update",
}
