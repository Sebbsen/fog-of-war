local BRICK_SIZE = 3
local BRICKS = {
	["L1"] = {
		{0, 1, 1},
		{0, 1, 0},
		{0, 0, 0}
	},
	["L2"] = {
		{0, 1, 1},
		{0, 0, 1},
		{0, 0, 0}
	},
	["L3"] = {
		{0, 1, 0},
		{1, 1, 0},
		{0, 0, 0}
	},
	["L4"] = {
		{1, 0, 0},
		{1, 1, 0},
		{0, 0, 0}
	},
	["T1"] = {
		{1, 1, 1},
		{0, 1, 0},
		{0, 0, 0}
	},
	["T2"] = {
		{1, 0, 0},
		{1, 1, 0},
		{1, 0, 0}
	},
	["T3"] = {
		{0, 0, 0},
		{0, 1, 0},
		{1, 1, 1}
	},
	["T4"] = {
		{0, 0, 1},
		{0, 1, 1},
		{0, 0, 1}
	},
	["I1"] = {
		{0, 1, 0},
		{0, 1, 0},
		{0, 1, 0}
	},
	["I2"] = {
		{0, 0, 0},
		{1, 1, 1},
		{0, 0, 0}
	},
	["O"] = {
		{0, 0, 0},
		{0, 1, 1},
		{0, 1, 1}
	}
}

-- L1-4 T1-4 I1-2 O

local BRICK_SEQUENCE = {
	"T1", "L4", "O", "I2", "L2", "T3", "I1", "L1", "T4", "O", 
	"L3", "T2", "I2", "L1", "T1", "O", "L4", "I1", "T3", "L2"
}

local CURRENT_BRICK = 1

function get_next_brick()
	local brick_letter = BRICK_SEQUENCE[CURRENT_BRICK]
	CURRENT_BRICK = CURRENT_BRICK+1
	msg.post("main:/gui#game", "current_tiles", {current = brick_letter, next = BRICK_SEQUENCE[CURRENT_BRICK+1]})
	return BRICKS[brick_letter]
end

function get_next_preview_brick()
	local brick_letter = BRICK_SEQUENCE[CURRENT_BRICK + 1]
	return BRICKS[brick_letter]
end