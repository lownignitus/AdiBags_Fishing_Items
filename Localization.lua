local addonName, addon = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.L = L

local locale = GetLocale()

if locale == "deDE" then
--Translation missing
elseif locale == "enUS" then
L["Fishing Items"] = true
L["Fishing Items and Fishing Accessories."] = true
L["Fishing Poles"] = true
L["Display Fishing Poles"] = true
L["Fishing Hats"] = true
L["Display Fishing Hats"] = true
L["Fishing Boots"] = true
L["Display Fishing Boots"] = true
L["Fishing Enchantments"] = true
L["Items that enchant fishing poles or gloves"] = true
L["Fishing bobbers"] = true
L["Items that change the look of your Bobber"] = true
L["Fishing Lures"] = true
L["Temporary pole enchantments"] = true
L["Consumables"] = true
L["Items that are fishing related and consumed on use"] = true
L["Toy Box Items"] = true
L["Fishing related items located in the Toy box"] = true
L["Fishing Heirlooms"] = true
L["Display fishing heirlooms"] = true
L["Usable Fishing Items"] = true
L["Items in bag with /use ability"] = true
L["Nat Pagel Rep Items"] = true
L["Rep items for Nat from Pandaria"] = true
L["Warlords Baits"] = true
L["Bait for Dreanor fish"] = true
L["Warlords Lunkers"] = true
L["Rare fish for Dreanor Nat Rep"] = true
L["Fishing Currencies in Bag"] = true
L["Fishing currencies that take bag space"] = true
L["Quest Reward Bags"] = true
L["Fishing Daily reward bags"] = true
L["Legion Baits"] = true
L["Bait for Legion Rare fish"] = true
L["Legion Baits for Dalaran Well"] = true
L["Bait to get certain Dalaran Well coins"] = true
L["Artifact Pole Quest Items"] = true
L["Items for the Underlight Angler questline"] = true
L["Legion Rare Fish"] = true
L["Rare fish for increasing Legion fishing skill or add AP to Underlight Angler"] = true
L["Fishing Friends Currency"] = true
L["Currencies for Legion Fishing Friends"] = true
L["BFA Items"] = true
L["Fishing items from BFA Zones"] = true
elseif locale == "esES" then
--Translation missing
elseif locale == "esMX" then
--Translation missing
elseif locale == "frFR" then
--Translation missing
elseif locale == "itIT" then
--Translation missing
elseif locale == "koKR" then
--Translation missing
elseif locale == "ptBR" then
--Translation missing
elseif locale == "ruRU" then
--Translation missing
elseif locale == "zhCN" then
--Translation missing
elseif locale == "zhTW" then
--Translation missing
end

-- values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
