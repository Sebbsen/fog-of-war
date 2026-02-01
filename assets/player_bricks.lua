local BRICK_SIZE = 3
local BRICKS = {
	["L1"] = {
		{0, 0, 0},
		{0, 1, 1},
		{0, 1, 0}
	},
	["L2"] = {
		{0, 0, 0},
		{1, 1, 0},
		{0, 1, 0}
	},
	["L3"] = {
		{0, 1, 0},
		{1, 1, 0},
		{0, 0, 0}
	},
	["L4"] = {
		{0, 1, 0},
		{0, 1, 1},
		{0, 0, 0}
	},
	["T1"] = {
		{0, 0, 0},
		{1, 1, 1},
		{0, 1, 0}
	},
	["T2"] = {
		{0, 1, 0},
		{0, 1, 1},
		{0, 1, 0}
	},
	["T3"] = {
		{0, 1, 0},
		{1, 1, 1},
		{0, 0, 0}
	},
	["T4"] = {
		{0, 1, 0},
		{1, 1, 0},
		{0, 1, 0}
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


local BRICK_GROUPS = {
	{"L1","L2","L3","L4"},
	{"T1","T2","T3","T4"},
	{"I1","I2","O","O"}
}

local LAST_BRICK_GROUP

local CURRENT_BRICK
local NEXT_BRICK

function get_random_brick()
	local current_brick_group = LAST_BRICK_GROUP
	while current_brick_group == LAST_BRICK_GROUP do
		current_brick_group = math.random(1, 3)
	end
	LAST_BRICK_GROUP = current_brick_group
	local brick_number = math.random(1, 4)
	local new_brick = BRICK_GROUPS[current_brick_group][brick_number]
	return new_brick
end

function get_next_brick()
	-- check if first brick
	if NEXT_BRICK == nil then
		CURRENT_BRICK = get_random_brick()
	else
		CURRENT_BRICK = NEXT_BRICK
	end
	
	NEXT_BRICK = get_random_brick()
	msg.post("main:/gui#game", "current_tiles", {current = CURRENT_BRICK, next = NEXT_BRICK})
	return BRICKS[CURRENT_BRICK]
end

function get_next_preview_brick()
	return BRICKS[NEXT_BRICK]
end