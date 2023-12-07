local lrex = require("rex_pcre")
local inspect = require('inspect')
local utils = require("common.utils")

-- for cubes in lrex.split(tries, ';') do


local function extract_items_by_line(line, file_items)
  local numberPattern = "\\d+"

  local game = lrex.match(line, numberPattern)
  colonIndex = string.find(line, ":")
  local cards = string.sub(line, colonIndex + 1)
  local pipeIndex = string.find(cards, "|")

  local winningCards = string.sub(cards, 0, pipeIndex)
  local myCards = string.sub(cards, pipeIndex)

  for card in lrex.gmatch(line, ' ') do

  end
end

local function calculate_points(input_file)
  local file_content = utils.read_file(input_file)
  local all_lines = utils.split_by_lines(file_content)
  local file_items = {}

  local total = 0
  local line_number = 1
  for _, line in pairs(all_lines) do
    extract_items_by_line(line, file_items);
    line_number = line_number + 1
  end

  for _, item in pairs(file_items) do
    if item.type == 'symbol' and item.value == "*" then
      -- local gear_ratio = calculate_gear_ratio(item, file_items)
      total = total + gear_ratio
    end
  end

  -- print(inspect(file_items))

  return total
end

local function run(input_file)
  local total = calculate_points(input_file)
  print("total", total)
  return total
end

return run
