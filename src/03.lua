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

local function number_is_adyacent_to_symbol(number, file_items)
    local result = false
    for _, symbol in pairs(file_items) do
        if symbol.type == 'symbol' then
            local adyacent_line = math.abs(number.line_number - symbol.line_number) <= 1

            local around = adyacent_line and number.index_start - 1 <= symbol.index_end and
                symbol.index_end <= number.index_end + 1

            -- print('around', around, number.value, symbol.line_number, symbol.value)

            if adyacent_line and around then
                -- print('is adyacent !', number.value, symbol.value)
                result = true
                break;
            end
        end
    end
    return result
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
        if item.type == 'number' then
            if number_is_adyacent_to_symbol(item, file_items) then
                total = total + tonumber(item.value)
            end
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
