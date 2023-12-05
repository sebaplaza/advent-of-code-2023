local run = require("03")

describe("gear ratios", function()
    it("should sum part numbers (input-example)", function()
        local result = run("resources/03/input-example.txt")
        assert.are.same(4361, result)
    end)

    it("should sum part numbers (input)", function()
        local result = run("resources/03/input.txt")
        assert.are.same(544664, result)
    end)
end)
