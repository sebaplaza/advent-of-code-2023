local function read_file(file_name)
    local file = io.open(file_name);
    if file then
        -- read (a)ll file
        local contents = file:read("a")
        file:close()
        return contents
    end
end

local function split_by_lines(text)
    -- "lines" is a table
    local lines = {}
    for line in string.gmatch(text, '[^\n]+') do
        table.insert(lines, line)
    end
    return lines
end

local function total_for_line(line)
    local pattern = "%d"
    local first_number = string.match(line, pattern)
    local reversed_line = string.reverse(line)
    local last_number = string.match(reversed_line, pattern)

    local total_by_line = tonumber(first_number .. last_number)
    return total_by_line
end

local function run(input_file)

    local file_content = read_file(input_file)
    local all_lines = split_by_lines(file_content)

    local total = 0
    for key, line in pairs(all_lines) do
        total = total + total_for_line(line);
    end

    print("total", total)
    return total
end

run("input.txt")

return run
