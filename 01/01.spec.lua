local run = require("01")

describe("sum module", function ()
  it("should return calibration", function ()
      local result = run("resources/input-example-a.txt")
      assert.are.same(142, result)
  end)

  it("should manage worded numbers", function ()
    local result = run("resources/input-example-b.txt")
    assert.are.same(281, result)
  end)
end)