local lrex = require("rex_pcre")
local utils = require("common.utils")

local export = {}

local function get_max_colors_by_line(line)

    -- Pattern to match the desired blocks
    local numberPattern = "\\d+"
    local bluePattern = "\\d+ blue"
    local greenPattern = "\\d+ green"
    local redPattern = "\\d+ red"

    local game = lrex.match(line, numberPattern)
    colonIndex = string.find(line, ":")
    local tries = string.sub(line, colonIndex + 1)

    local response = {
        game = tonumber(game),
        redMax = 0,
        blueMax = 0,
        greenMax = 0
    }

    for cubes in lrex.split(tries, ';') do
        local redCubes = lrex.match(cubes, redPattern)
        local blueCubes = lrex.match(cubes, bluePattern)
        local greenCubes = lrex.match(cubes, greenPattern)

        local redNumber = 0
        local blueNumber = 0
        local greenNumber = 0

        if redCubes then
            redNumber = tonumber(lrex.match(redCubes, numberPattern))
        end

        if blueCubes then
            blueNumber = tonumber(lrex.match(blueCubes, numberPattern))
        end

        if greenCubes then
            greenNumber = tonumber(lrex.match(greenCubes, numberPattern))
        end

        if redNumber > response.redMax then
            response.redMax = redNumber
        end

        if blueNumber > response.blueMax then
            response.blueMax = blueNumber
        end

        if greenNumber > response.greenMax then
            response.greenMax = greenNumber
        end

    end

    return response

end

function game_is_possible(total_colors, total_cubes)

    local is_possible = total_cubes.red >= total_colors.redMax and total_cubes.blue >= total_colors.blueMax and
                            total_cubes.green >= total_colors.greenMax

    return is_possible

end

function calculate_power(total_colors)
    local power = total_colors.redMax * total_colors.blueMax * total_colors.greenMax
    return power
end

function export.available_games_total(input_file, total_cubes)

    local file_content = utils.read_file(input_file)
    local all_lines = utils.split_by_lines(file_content)

    local total = 0
    for key, line in pairs(all_lines) do
        local total_colors = get_max_colors_by_line(line);
        local is_possible = game_is_possible(total_colors, total_cubes)

        if is_possible then
            total = total + total_colors.game
        end

    end

    print("total", total)
    return total
end

function export.games_power(input_file)
    local file_content = utils.read_file(input_file)
    local all_lines = utils.split_by_lines(file_content)

    local total = 0
    for key, line in pairs(all_lines) do
        local total_colors = get_max_colors_by_line(line);
        local power = calculate_power(total_colors)
        total = total + power
    end

    print("total power", total)
    return total
end

return export
