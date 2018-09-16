return function(self, playerIndex, x, y)
    local playerPath = self.playerPaths["player" .. playerIndex] or self.playerPaths[playerIndex]

    for currentPathIndex, path in pairs(playerPath.paths) do
        if playerPath.followPathIndex == nil or currentPathIndex == playerPath.followPathIndex then
            for followCurrentIndex, point in pairs(path.points) do
                -- check if any point is done in the path
                if point.done then break end

                local pointsCount = lume.count(path.points)

                if not point.active then
                    -- check for circular distance from cursor
                    local distance = math.pow(x - (path.initialPoint.x + point.x), 2) + math.pow(y - (path.initialPoint.y + point.y), 2)

                    if distance <= math.pow(self.cursorRadius, 2) then
                        if playerPath.followInitialIndex then
                            if playerPath.followDirection then
                                -- activate more points on path (determined by direction)
                                if playerPath.followPreviousIndex == pointsCount and followCurrentIndex == 1 and playerPath.followDirection == 1 then
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                elseif playerPath.followPreviousIndex == 1 and followCurrentIndex == pointsCount and playerPath.followDirection == -1 then
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                elseif math.abs(followCurrentIndex - playerPath.followPreviousIndex) == 1 and playerPath.followDirection == followCurrentIndex - playerPath.followPreviousIndex then
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                end
                            else
                                -- activate second point on path and determine direction
                                if playerPath.followInitialIndex == pointsCount and followCurrentIndex == 1 then
                                    playerPath.followDirection = 1
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                elseif playerPath.followInitialIndex == 1 and followCurrentIndex == pointsCount then
                                    playerPath.followDirection = -1
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                elseif math.abs(followCurrentIndex - playerPath.followInitialIndex) == 1 then
                                    playerPath.followDirection = followCurrentIndex - playerPath.followInitialIndex
                                    playerPath.followPreviousIndex = followCurrentIndex
                                    point.active = true
                                end
                            end
                        else
                            -- activate first point on path
                            playerPath.followInitialIndex = followCurrentIndex
                            playerPath.followPreviousIndex = followCurrentIndex
                            point.active = true
                            if playerPath.followPathIndex == nil then
                                playerPath.followPathIndex = currentPathIndex
                            end
                        end
                    end
                end

                -- check for all points active
                local activePointsCount = lume.count(path.points, "active")

                if activePointsCount == pointsCount then
                    -- set all points on current path to done
                    for index, point in pairs(path.points) do
                        point.done = true
                    end

                    path.done = true

                    -- reset current player path
                    playerPath.followInitialIndex = nil
                    playerPath.followDirection = nil
                    playerPath.followPreviousIndex = nil
                    playerPath.followPathIndex = nil
                end
            end
        end

    end
end
