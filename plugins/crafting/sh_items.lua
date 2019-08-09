//To add a new item or remove an item, this is the file to do it.

local ITEMS = {}

for k, v in pairs(ITEMS) do
	local ITEM = ix.item.Register(k, nil, false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model
	ITEM.description = v.description
	ITEM.category = "Tools"
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.isTool = v.tool or false
end