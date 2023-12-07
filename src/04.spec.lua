local run = require("04")

describe("Scratchcards", function()
    it("should calculate points (input-example)", function()
        local result = run("resources/04/input-example.txt")
        assert.are.same(13, result)
    end)

    -- it("should calculate points (input)", function()
    --     local result = run("resources/04/input.txt")
    --     assert.are.same(84495585, result)
    -- end)
end)
