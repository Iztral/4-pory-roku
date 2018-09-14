return function(self, key)
    if key == "f" then
        print(lume.serialize(self.initialPoint))
        for k, v in pairs(self.points) do
            print(k .. ": " .. lume.serialize(v))
        end
    end
end
