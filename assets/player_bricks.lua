local BRICK_SIZE = 3
local BRICKS = {
	["L"] = {
		{0, 1, 0},
		{0, 1, 0},
		{0, 1, 1}
	},
	["J"] = {
		{0, 1, 0},
		{0, 1, 0},
		{1, 1, 0}
	},
	["T"] = {
		{0, 0, 0},
		{1, 1, 1},
		{0, 1, 0}
	}
}

local BRICK_SEQUENCE = {"T","J","L","J","T","J","L","J","J","L","J","T","J","L","J","J","T"}

local CURRENT_BRICK = 1

function get_next_brick()
	local brick_letter = BRICK_SEQUENCE[CURRENT_BRICK]
	CURRENT_BRICK = CURRENT_BRICK+1
	return BRICKS[brick_letter]
end

function get_next_preview_brick()
	local brick_letter = BRICK_SEQUENCE[CURRENT_BRICK + 1]
	return BRICKS[brick_letter]
end