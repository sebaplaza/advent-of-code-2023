local run = require("run")

describe("sum module", function ()
  it("should return calibration", function ()
      local result = run("input-example.txt")
      assert.are.same(142, result)
  end)

  it("should manage worded numbers", function ()
    local result = run("input-example2.txt")
    assert.are.same(281, result)
  end)
end)