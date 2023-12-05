local lrex = require("rex_pcre")
local inspect = require('inspect')
local utils = require("common.utils")

local function is_numeric(x)
    if tonumber(x) ~= nil then
        return true
    end
    return false
end

local function extract_items_by_line(line, line_number, file_items)
    local pattern = "(\\d+|[^.0-9])"

    -- local match
    local next_index_start = 0


    repeat
        index_start, index_end, match = lrex.find(line, pattern, next_index_start);

        -- print('match', match)
        if match then
            local type = 'symbol'
            if is_numeric(match) then
                type = 'number'
            end

            table.insert(file_items, {
                line_number = line_number,
                type = type,
                value = match,
                index_start = index_start,
                index_end = index_end,
            })
        end
        if (index_end) then
            next_index_start = index_end + 1
        end
    until match == nil
end

local function are_adjacent(symbol, number)
    local adjacent_line = math.abs(number.line_number - symbol.line_number) <= 1

    local around = adjacent_line and number.index_start - 1 <= symbol.index_end and
        symbol.index_end <= number.index_end + 1

    return adjacent_line and around
end


local function calculate_gear_ratio(gear, file_items)
    local total = 1
    local total_numbers = 0
    for _, number in pairs(file_items) do
        if number.type == 'number' then
            if are_adjacent(gear, number) then
                total_numbers = total_numbers + 1;
                total = total * number.value
            end
        end
    end
    if total_numbers > 1 then
        return total
    else
        return 0
    end
end



local function generate_sum(input_file)
    local file_content = utils.read_file(input_file)
    local all_lines = utils.split_by_lines(file_content)
    local file_items = {}

    local total = 0
    local line_number = 1
    for _, line in pairs(all_lines) do
        extract_items_by_line(line, line_number, file_items);
        line_number = line_number + 1
    end

    for _, item in pairs(file_items) do
        if item.type == 'symbol' and item.value == "*" then
            local gear_ratio = calculate_gear_ratio(item, file_items)
            total = total + gear_ratio
        end
    end

    -- print(inspect(file_items))

    return total
end

local function run(input_file)
    local total = generate_sum(input_file)
    print("total", total)
    return total
end

return run
