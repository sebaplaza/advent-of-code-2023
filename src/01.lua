local utils = require("common.utils")
local lrex = require("rex_pcre")

local function total_for_line(line)
    local pattern = "(\\d|one|two|three|four|five|six|seven|eight|nine)"
    local last_index, _, first_number = lrex.find(line, pattern)
    local last_number = nil

    repeat
        -- why this? because we have to avoid should work for overlapped patterns
        last_index, _, match = lrex.find(line, pattern, last_index + 1);
        if match then
            last_number = match
        end
    until match == nil

    if last_number == nil then
        -- if have no number at the end, we need to search from the last last_index
        last_index, _, last_number = lrex.find(line, pattern, last_index);
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

run("resources/01/input.txt")

return run
