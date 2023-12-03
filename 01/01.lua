local utils = require("common.utils")
local lrex = require("rex_pcre")

local function total_for_line(line)
    local pattern = "\\d|one|two|three|four|five|six|seven|eight|nine"

    local first_number = lrex.match(line, pattern)

    local last_number = nil
    for match in lrex.gmatch(line, pattern) do
        last_number = match
    end
    local concatenated = utils.convert_to_number(first_number) .. utils.convert_to_number(last_number)
    local total_by_line = tonumber(concatenated)
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

-- run("resources/input.txt")

return run
