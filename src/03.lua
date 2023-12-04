local lrex = require("rex_pcre")
local utils = require("common.utils")

local function parse_line(line)
    local line_info = {}
    local patternNumbers = "(\\d+)"

    for match in lrex.gmatch(line, patternNumbers) do
        print('match', match)
    end

end

local function generate_sum(input_file)

    local file_content = utils.read_file(input_file)
    local all_lines = utils.split_by_lines(file_content)
    local lines_content = {}

    local total = 0
    for key, line in pairs(all_lines) do
        local parsed = parse_line(line);
    end

    return 4361

end

local function run(input_file)

    local total = generate_sum(input_file)
    print("total", total)
    return total
end

return run
