local run = require("03")

describe("gear ratios", function()
    it("should sum part numbers (input-example)", function()
        local result = run("resources/03/input-example.txt")
        assert.are.same(467835, result)
    end)

    it("should sum part numbers (input)", function()
        local result = run("resources/03/input.txt")
        assert.are.same(84495585, result)
    end)
end)
