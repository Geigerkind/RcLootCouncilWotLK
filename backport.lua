local inventorySlots = {
	"HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "WristSlot",
	"HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot",
	"Trinket0Slot", "Trinket1Slot", "MainHandSlot", "SecondaryHandSlot", "RangedSlot"
}

function GetAverageItemLevel()
    local total, items = 0, 0
	for i = 1, #inventorySlots do
		local itemLink = GetInventoryItemLink("player", GetInventorySlotInfo(inventorySlots[i]))

		if itemLink then
			local iLvl = select(4, GetItemInfo(itemLink))
			if iLvl and iLvl > 0 then
				items = items + 1
				total = total + iLvl
			end
		end
	end

	if items == 0 then
		return nil, 0
	end

	return nil, floor(total / items)
end

function IsInRaid()
	local is_in_instance, type = IsInInstance()
	return is_in_instance and type == "raid"
end

function GetNumGroupMembers()
	return GetNumRaidMembers()
end

function Ambiguate(name, other) 
	return name
end

function UnitIsGroupLeader()
	return IsRaidLeader()
end

function UnitIsGroupAssistant()
	return IsRaidOfficer()
end