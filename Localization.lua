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
L["BFA 8.2 Items"] = true
L["Fishing items from BFA 8.2 Zones"] = true
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
	-- from gjfLeo
L["Fishing Items"] = "钓鱼物品"
L["Fishing Items and Fishing Accessories."] = "钓鱼物品和相关道具。"
L["Fishing Poles"] = "鱼竿"
L["Display Fishing Poles"] = "显示鱼竿"
L["Fishing Hats"] = "渔帽"
L["Display Fishing Hats"] = "显示渔帽"
L["Fishing Boots"] = "渔鞋"
L["Display Fishing Boots"] = "显示渔鞋"
L["Fishing Enchantments"] = "钓鱼附魔"
L["Items that enchant fishing poles or gloves"] = "增强鱼竿或手套的物品"
L["Fishing bobbers"] = "浮标"
L["Items that change the look of your Bobber"] = "改变浮标外观的物品"
L["Fishing Lures"] = "鱼饵"
L["Temporary pole enchantments"] = "临时的鱼竿附魔"
L["Consumables"] = "消耗品"
L["Items that are fishing related and consumed on use"] = "与钓鱼相关的消耗品"
L["Toy Box Items"] = "玩具"
L["Fishing related items located in the Toy box"] = "玩具箱中与钓鱼相关的物品"
L["Fishing Heirlooms"] = "钓鱼传家宝"
L["Display fishing heirlooms"] = "显示钓鱼传家宝"
L["Usable Fishing Items"] = "可使用的钓鱼物品"
L["Items in bag with /use ability"] = "背包里含“使用：”效果的物品"
L["Nat Pagel Rep Items"] = "纳特·帕格声望物品"
L["Rep items for Nat from Pandaria"] = "潘达利亚提升纳特·帕格声望的道具"
L["Warlords Baits"] = "德拉诺鱼饵"
L["Bait for Dreanor fish"] = "《德拉诺之王》鱼饵"
L["Warlords Lunkers"] = "德拉诺大鱼"
L["Rare fish for Dreanor Nat Rep"] = "德拉诺纳特·帕格的稀有鱼"
L["Fishing Currencies in Bag"] = "钓鱼货币"
L["Fishing currencies that take bag space"] = "占背包栏位的钓鱼货币"
L["Quest Reward Bags"] = "任务奖励包"
L["Fishing Daily reward bags"] = "钓鱼日常奖励的包裹"
L["Legion Baits"] = "军团鱼饵"
L["Bait for Legion Rare fish"] = "《军团再临》鱼饵"
L["Legion Baits for Dalaran Well"] = "达拉然喷泉鱼饵"
L["Bait to get certain Dalaran Well coins"] = "用来获取特定达拉然喷泉硬币的鱼饵"
L["Artifact Pole Quest Items"] = "神器鱼竿任务物品"
L["Items for the Underlight Angler questline"] = "幽光鱼竿任务线相关物品"
L["Legion Rare Fish"] = "军团稀有鱼"
L["Rare fish for increasing Legion fishing skill or add AP to Underlight Angler"] = "提升军团钓鱼点数或幽光鱼竿神器能量的稀有鱼"
L["Fishing Friends Currency"] = "钓友货币"
L["Currencies for Legion Fishing Friends"] = "群岛钓友的货币"
L["BFA Items"] = "争霸艾泽拉斯物品"
L["Fishing items from BFA Zones"] = "争霸艾泽拉斯地区的钓鱼物品"
elseif locale == "zhTW" then
--Translation missing
end

-- values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
