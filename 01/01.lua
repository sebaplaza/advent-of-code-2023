local utils = require("common.utils")

local function total_for_line(line)
    local pattern = "%d"
    local first_number = string.match(line, pattern)
    local reversed_line = string.reverse(line)
    local last_number = string.match(reversed_line, pattern)

    local total_by_line = tonumber(first_number .. last_number)
    return total_by_line
end

local function run(input_file)

    local file_content = utils.read_file(input_file)
    local all_lines = utils.split_by_lines(file_content)

    local total = 0
    for key, line in pairs(all_lines) do
        total = total + total_for_line(line);
    end

    print("total", total)
    return total
end

run("resources/input.txt")

return run
