
local handle
local current_file

local function stop_music()
	if handle then
		core.sound_stop(handle)
		handle = nil
		current_file = nil
	end

	return handle == nil
end

local function play_music(fname)
	if not fname then return false end

	-- don't play over another song
	stop_music()
	if handle ~= nil then
		core.log("error", "could not stop playing sound handle " .. handle .. ": " .. tostring(current_file))
		return false
	end

	handle = core.sound_play({name=fname, gain=1.0})
	local playing = handle ~= nil and handle > 0

	if playing then
		current_file = fname
	end

	return playing
end

core.register_chatcommand("cmus", {
	params = "<command> [<music_file>]",
	description = "Manage music\n\nCommands:\n\tplay:\tPlay a music file.\n\tstop:\tStop playing music.",
	func = function(param)
		if param == "" then
			return false, "missing command"
		end

		local command
		local mus_file
		local idx = param:find(" ")
		if idx then
			command = param:sub(1, idx-1)
			mus_file = param:gsub("^" .. command .. " ", "")
		else
			command = param
		end

		if command == "play" then
			if not mus_file then
				return false, "must supply music filename"
			end

			if not play_music(mus_file) then
				return false, "failed to play music: " .. mus_file
			end
		elseif command == "stop" then
			if not stop_music() then
				return false, "failed to stop music: " .. tostring(current_file)
			end
		else
			return false, "unknown command: " .. command
		end

		return true
	end,
})

core.register_chatcommand("stop", {
	description = "Stop music",
	func = function(param)
		stop_music()
	end,
})
