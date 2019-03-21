-- Spawns a new thread without waiting one step

local unpack = unpack
local ArgumentsBindable = Instance.new("BindableEvent")
local VoidBindable = Instance.new("BindableEvent")

ArgumentsBindable.Event:Connect(function(Function, Pointer) Function(Pointer()) end)
VoidBindable.Event:Connect(function(Function) Function() end)

local function FastSpawn(Function, ...)
	--- Spawns a new thread to run a function on without waiting one step
	-- @param function Func The function to run on a new thread
	-- @{...} parameters to pass to Func
	
	if ... ~= nil then
		local Arguments = {...}
		local function Pointer() return unpack(Arguments) end
		ArgumentsBindable:Fire(Function, Pointer)
	else
		VoidBindable:Fire(Function)
	end
end

return FastSpawn
