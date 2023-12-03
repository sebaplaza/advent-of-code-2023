local run = require("02")

describe("should calculate available games", function()
    it("should calculate total sum for available games (input-example)", function()
        local total_cubes = {
            red = 12,
            green = 13,
            blue = 14
        }
        local result = run.available_games_total("resources/02/input-example.txt", total_cubes)
        assert.are.same(8, result)
    end)

    it("should calculate total sum for available games (input)", function()
        local total_cubes = {
            red = 12,
            green = 13,
            blue = 14
        }
        local result = run.available_games_total("resources/02/input.txt", total_cubes)
        assert.are.same(1853, result)
    end)

    it("should calculate 'power' of games (input-example)", function()
        local result = run.games_power("resources/02/input-example.txt")
        assert.are.same(2286, result)
    end)

    it("should calculate 'power' of games (input)", function()
        local result = run.games_power("resources/02/input.txt")
        assert.are.same(72706, result)
    end)

end)
