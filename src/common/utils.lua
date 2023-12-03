local exports = {}

function exports.read_file(file_name)
    local file = io.open(file_name);
    if file then
        -- read (a)ll file
        local contents = file:read("a")
        file:close()
        return contents
    end
end

function exports.split_by_lines(text)
    -- "lines" is a table
    local lines = {}
    for line in string.gmatch(text, '[^\n]+') do
        table.insert(lines, line)
    end
    return lines
end

function exports.convert_to_number(text)
    -- Attempt to convert the string to a number
    local number = tonumber(text)
    if number then
        return number
    else
        local numbers_map = {
            ["one"] = 1,
            ["two"] = 2,
            ["three"] = 3,
            ["four"] = 4,
            ["five"] = 5,
            ["six"] = 6,
            ["seven"] = 7,
            ["eight"] = 8,
            ["nine"] = 9
        }
        return numbers_map[text]
    end
end

return exports
