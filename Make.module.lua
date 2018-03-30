-- @author Validark
-- @readme https://github.com/NevermoreFramework/Helper#make

return function(InstanceType)
	return function(Table, ...)
		local Object = Instance.new(InstanceType)
		local Parent = Table.Parent
	
		if Parent then
			Table.Parent = nil
		end
		
		for Property = 1, #Table do
			local Value = Table[Property]
			if type(Property) == "number" then
				Value.Parent = Object
			else
				Object[Property] = Value
			end
		end
	
		if Parent then
			Object.Parent = Parent
		end
	
		if ... then
			local Objects = {...}
			for a = 1, #Objects do
				local aValue = Objects[a]
				local Object = Object:Clone()
				for Property = 1, #aValue do
					local Value = aValue[Property]
					if type(Property) == "number" then
						Value.Parent = Object
					else
						Object[Property] = Value
					end
				end
				Object.Parent = not Object.Parent and Parent
				Objects[a] = Object
			end
			return Object, unpack(Objects)
		else
			return Object
		end
	end
end
