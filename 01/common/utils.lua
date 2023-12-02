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

return exports
