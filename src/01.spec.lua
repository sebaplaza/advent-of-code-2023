local run = require("01")

describe("sum module", function()
    it("should return calibration (input-example-a)", function()
        local result = run("resources/01/input-example-a.txt")
        assert.are.same(142, result)
    end)

    it("should manage worded numbers (input-example-b)", function()
        local result = run("resources/01/input-example-b.txt")
        assert.are.same(281, result)
    end)

    it("should work for overlapped patterns", function()
        local result = run("resources/01/input-bug.txt")
        assert.are.same(78, result)
    end)

    it("should return calibration (input)", function()
        local result = run("resources/01/input.txt")
        assert.are.same(53539, result)
    end)

end)
