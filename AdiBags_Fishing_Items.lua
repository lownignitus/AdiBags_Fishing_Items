--[[
Title: AdiBags - Fishing Items
Version: v1.0.9
Author LownIgnitus - Mihkael-Alexstrasza
Add various Fishing items to AdiBags filter groups
]]


local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L
local MatchIDs
local Tooltip
local Result = {}

local function AddToSet(Set, List)
	for _, v in ipairs(List) do
		Set[v] = true
	end
end

-- Fishing Poles
local poles = {
	6256,		-- Fishing Pole
	6365,		-- Strong Fishing Pole - +5 fishing skill
	6366,		-- Darkwood Fishing Pole - +8 fishing skill
	6367,		-- Big Iron Fishing Pole - +10 fishing skill
	12225,		-- Blump Family Fishing Pole - +3 fishing skill
	19022,		-- Nat Pagle's Extreme Angler FC-5000 - +10 fishing skill
	19970,		-- Arcanite Fishing Pole - +14 fishing skill
	25978,		-- Seth's Graphite Fishing Pole - +10 fishing skill
	44050,		-- Mastercraft Kalu'ak Fishing Pole - +13 fishing skill and Underwater breathing
	45858,		-- Nat's Lucky Fishing Pole - +12 fishing skill
	45991,		-- Bone Fishing Pole - +13 fishing skill
	45992,		-- Jeweled Fishing Pole - +13 fishing skill
	46337,		-- Staats' Fishing Pole - +3 fishing skill
	84660,		-- Pandaren Fishing Pole - +7 fishing skill
	84661,		-- Dragon Fishing Pole - +13 fishing skill
	116825,		-- Savage Fishing Pole - +13 fishing skill and Lure +10
	116826,		-- Draenic Fishing Pole - +13 fishing skill and Lure +10
	118381,		-- Ephemeral Fishing Pole - +14 fishing skill
	120163,		-- Thruk's Fishing Rod - +3 fishing skill
	133755,		-- Underlight Angler - +15 fishing skill and Teleport to pools
	168804, 	--Powered Piscine Procurement Pole - +15 Fishing Skill, Drop from Deepwater Maw
}

-- Hats
local hats = {
	19972,		-- Lucky Fishing Hat - +5 fishing skill
	33820,		-- Weather-Beaten Fishing Hat - +5 fishing skill and Lure +7
	88710,		-- Nat's Hat - +5 fishing skill and Lure +10
	93732,		-- Darkmoon Fishing Cap - +5 fishing skill and Summon a pool of shipwrecked debris
	117405,		-- Nat's Drinking Hat - +8 fishing skill and Lure +10
	118380,		-- Hightfish Cap - +5 fishing skill
	118393,		-- Tentacled Hat - +5 fishing skill
}

-- Boots
local boots = {
	19969,		-- Nat Pagle's Extreme Anglin' Boots - +5 fishing skill
	50287,		-- Boots of the Bay - +10 fishing skill and Whisks you away to the finest drinking establishment in Booty Bay
	155459,		-- Anglin' Art's Sandals - +5 fishing skill
	155468,		-- Anglin' Art's Treads - +5 fishing skill
	155476,		-- Anglin' Art's Waders - +5 fishing skill
	155484,		-- Anglin' Art's Stompers - +5 fishing skill
}

-- Enchantments
local enchants = {
	13620,		-- Fishing Glove Enchant - +2 fishing skill
	19971,		-- High Test Eternium Fishing Line - +5 fishing skill
	34836,		-- Spun Truesilver Fishing Line - +3 fishing skill
	68796,		-- Reinforced Fishing Line - +1 fishing skill
	71692,		-- Angler Glove Enchant - +5 fishing skill
	116117,		-- Rook's Lucky Fishin' Line - +4 fishing skill
	153203,		-- Ancient Fishing Line - +6 fishing skill
}

-- Bobbers
local bobbers = {
	133688,		-- Tugboat Bobber
	136375,		-- Squeaky Duck Bobber
	136376,		-- Murloc Bobber
	136377, 	--Oversized Bobber
	142528,		-- Crate of Bobbers: Can of Worms
	142529,		-- Crate of Bobbers: Cat Head
	142530,		-- Crate of Bobbers: Tugboat
	142531,		-- Crate of Bobbers: Squeaky Duck
	142532,		-- Crate of Bobbers: Murloc Head
	143662,		-- Crate of Bobbers: Wooden Pepe
	147307,		-- Crate of Bobbers: Carved Wooden Helm
	147308,		-- Crate of Bobbers: Enchanted Bobber
	147309,		-- Crate of Bobbers: Face of the Forest
	147310,		-- Crate of Bobbers: Floating Totem
	147311,		-- Crate of Bobbers: Replica Gondola
	147312,		-- Crate of Bobbers: Demon Noggin
}

-- Lures
local lures = {
	6529,		-- Shiny Bauble - +3 fishing skill
	6530,		-- Nightcrawlers - +5 fishing skill
	6532,		-- Bright Baubles - +7 fishing skill
	6533,		-- Aquadynamic Fish Attractor - +9 fishing skill
	6811,		-- Aquadynamic Fish Lens - +5 fishing skill
	7307,		-- Flesh Eating Worm - +7 fishing skill
	34861,		-- Sharpened Fish Hook - +9 fishing skill
	46006,		-- Glow Worm - +9 fishing skill
	62673,		-- Feathered Lure - +9 fishing skill
	67404,		-- Glass Fishing Bobber - +2 fishing skill
	68049,		-- Heat-Treated Spinning Lure - +10 fishing skill
	118391,		-- Worm Supreme - +10 fishing skill
}

-- Consumable Items
local consumables = {
	5996,		-- Elixir of Water Breathing
	6372,		-- Swim Speed Potion - +100% swim speed
	8827,		-- Elixir of Water Walking
	18294,		-- Exilir of Greater Water Breathing
	34109,		-- Weather-Beaten Journal - Fishing Pools on minimap
	34832,		-- Captain Rumsey's Lager - +5 fishing skill
	76096,		-- Darkwater Potion - +70% movement speed +200% swim speed
	110508,		-- "Fragrant" Pheromone Fish
	111356,		-- Fishing Guide to Draenor
	112633,		-- Frostdeep Minnow - Summon Cavedweller Horde
	116158,		-- Lunarfall Carp - Summon Cavedweller Alliance
	116271,		-- Draenic Water Breathing Elixir
	118414,		-- Awesomefish
	118415,		-- Grieferfish
	118511,		-- Tyfish
	118711,		-- Draenic Water Walking Elixir
	124674,		-- Day-Old Darkmoon Doughnut - +10 fishing skill
	141975,		-- Mark of Aquaos
	152550,		-- Sea Mist Potion
}

-- Toy Box Items
local toys = {
	85500,		-- Anglers Fishing Raft
	85973,		-- Ancient Pandaren Fishing Charm
	33223,		-- Fishing Chair
	86596,		-- Nat's Fishing Chair
	86582,		-- Aqua Jewel - +50% swim speed water breathing
	152556,		-- Trawler Totem - +4 fishing skill
}

-- Heirlooms
local heirlooms = {
	88563,		-- Nat's Fishing Journal - +15 to Pandaria fishing skill
	117401,		-- Nat's Draenic Fishing Journal - + 25 Draenor fishing skill
}

-- On Use Items
local usables = {
	19979,		-- Hook of the Master Angler - Turns you into a fish
	88535,		-- Sharpenend Tuskarr Spear - +5 fishing skill
	107950,		-- Fishing Raft for MAGES ONLY
}

-- Nat Pagle Rep Items
local natMoP = {
	86542,		-- Flying Tiger Gourami
	86545,		-- Mimic Octopus
	86544,		-- Spinefish Alpha
}

--WoD Baits
local wodBait = {
	110274,		-- Jawless Skulker Bait
	110289,		-- Fat Sleeper Bait
	110290,		-- Blind Lake Sturgeon Bait
	110291,		-- Fire Ammonite Bait
	110292,		-- Sea Scorpion Bait
	110293,		-- Abyssal Gulper Eel Bait
	110294,		-- Blackwater Whiptail Bait
	122742,		-- Bladebone Hook
	128229,		-- Felmouth Frenzy Bait
}

-- WoD Lunkers
local lunkers = {
	116817,		-- Blackwater Whiptail Lunker
	116818,		-- Abyssal Gulper Lunker
	116819,		-- Fire Ammonite Lunker
	116820,		-- Blind Lake Lunker
	116821,		-- Fat Sleeper Lunker
	116822,		-- Jawless Skulker Lunker
	122696,		-- Sea Scorpion Lunker
	127994,		-- Felmouth Frenzy Lunker		
}

-- Bag Space Currencies
local currency = {
	117397,		-- Nat's Lucky Coin
	124669,		-- Darkmoon Daggermaw
	138777,		-- Drowned Mana
}

-- Quest Reward Bags
local questBags = {
	35348,		-- Bag of Fishing Treasures
	67414,		-- Bag of Shiny Things
}

-- Legion Baits
local legionBait = {
	133701,		-- Skrog Toenail
	133702,		-- Aromatic Murloc Slime
	133703,		-- Pearlescent Conch
	133704,		-- Rusty Queenfish Brooch
	133705,		-- Rotten Fishbone
	133707,		-- Nightmare Nightcrawler
	133708,		-- Drowned Thistleleaf
	133709,		-- Funky Sea Snail
	133710,		-- Salmon Lure
	133711,		-- Swollen Murloc Egg
	133712,		-- Frost Worm
	133713,		-- Moosehorn Hook
	133714,		-- Silverscale Minnow
	133715,		-- Ancient Vrykul Ring
	133716,		-- Soggy Drakescale
	133717,		-- Enchanted Lure
	133719,		-- Sleeping Murloc
	133720,		-- Demonic Detritus
	133721,		-- Message in a Beer Bottle
	133722,		-- Axefish Lure
	133723,		-- Stunned, Angry Shark
	133724,		-- Decayed Whale Blubber
	133795,		-- Ravenous Fly
	139175,		-- Arcane Lure
}

-- Legion Baits for Dalaran Well
local legionWellBait = {
	138956,		-- Hypermagnetic Lure
	138957,		-- Auriphagic Sardine
	138958,		-- Glob of Really Sticky Glue
	138959,		-- Micro-Vortex Generator
	138960,		-- Wish Crystal
	138961,		-- Alchemical Bonding Agent
	138962,		-- Starfish on a String
	138963,		-- Tiny Little Grabbing Apparatus
}

-- Artifact Pole Quest Items
local legionArtifact = {
	133887,		-- Luminous Pearl - Starts Artifact Pole Quest
	138114,		-- Gloaming Frenzy - Quest Fish
}

-- LEgion Rare Fish
local legionRareFish = {
	133725,		-- Leyshimmer Blenny - +5 Legion Skill
	133726,		-- Nar'thalas Hermit - +5 Legion Skill
	133727,		-- Ghostly Queenfish - +5 Legion Skill
	133728,		-- Terrorfin - +5 Legion Skill
	133729,		-- Thorned Flounder - +5 Legion Skill
	133730,		-- Ancient Mossgill - +5 Legion Skill
	133731,		-- Mountain Puffer - +5 Legion Skill
	133732,		-- Coldriver Carp - +5 Legion Skill
	133733,		-- Ancient Highmountain Salmon - +5 Legion Skill
	133734,		-- Oodelfjisk - +5 Legion Skill
	133735,		-- Graybelly Lobster - +5 Legion Skill
	133736,		-- Thundering Stormray - +5 Legion Skill
	133737,		-- Magic-Eater Frog - +5 Legion Skill
	133738,		-- Seerspine Puffer - +5 Legion Skill
	133739,		-- Tainted Runescale Koi - +5 Legion Skill
	133740,		-- Axefish - +5 Legion Skill
	133741,		-- Seabottom Squid - +5 Legion Skill
	133742,		-- Ancient Black Barracuda - +5 Legion Skill
	139652,		-- Leyshimmer Blenny - +50 AP to fishing Artifact
	139653,		-- Nar'thalas Hermit - +50 AP to fishing Artifact
	139654,		-- Ghostly Queenfish - +50 AP to fishing Artifact
	139655,		-- Terrorfin - +50 AP to fishing Artifact
	139656,		-- Thorned Flounder - +50 AP to fishing Artifact
	139657,		-- Ancient Mossgill - +50 AP to fishing Artifact
	139658,		-- Mountain Puffer - +50 AP to fishing Artifact
	139659,		-- Coldriver Carp - +50 AP to fishing Artifact
	139660,		-- Ancient Highmountain Salmon - +50 AP to fishing Artifact
	139661,		-- Oodelfjisk - +50 AP to fishing Artifact
	139662,		-- Graybelly Lobster - +50 AP to fishing Artifact
	139663,		-- Thundering Stormray - +50 AP to fishing Artifact
	139664,		-- Magic-Eater Frog - +50 AP to fishing Artifact
	139665,		-- Seerspine Puffer - +50 AP to fishing Artifact
	139666,		-- Tainted Runescale Koi - +50 AP to fishing Artifact
	139667,		-- Axefish - +50 AP to fishing Artifact
	139668,		-- Seabottom Squid - +50 AP to fishing Artifact
	139669,		-- Ancient Black Barracuda - +50 AP to fishing Artifact
}

-- Fishing Friends Currency
local fishFriends = {
	146848,		-- Fragmented Enchantment - Azsuna
	146959,		-- Corrupted Globule - Val'sharah
	146960,		-- Ancient Totem Fragment- Highmountain
	146961,		-- Shiny Bauble - Stormheim
	146962,		-- Golden Minnow- Suramar
	146963,		-- Desecrated Seaweed - Broken Shore
	152583,		-- Underlight Emerald - New Skin
}

-- BFA Items
local bfaFish = {
	162515,		-- Midnight Salmon - Teleport to nearest fishing pool
	162516,		-- Rasboralus
	162517,		-- U'taka
}

-- BFA 8.2 Items
local bfaItems = {
	--167562, 	--Ionized Minnow
	167600, 	--Sludge-fouled Carp - 65, 51
	167654, 	--Bottom Feeding Stinkfish - 79, 49
	167655, 	--Bolted Steelhead
	167656, 	--Pond Hopping Springfish - 65, 32
	167657, 	--Shadowy Cave Eel - 59, 24
	167658, 	--Mechanical Blowfish - 25, 77
	167659, 	--Spitting Clownfish - 83, 72
	167661, 	--Energized Lightning Cod
	167662, 	--Solarsprocket Barbel
	167663, 	--Tasty Steelfin - 47, 37
	167698, 	--Secret Fish Goggles - Lets you see Secret Fish
	167705, 	--Mechanized Mackerel - Mechagon
	167706, 	--Jade Story Fish - Jade Forest, Garrosh'ar Point
	167707, 	--Kirin Tor Clown - Dalaran (Broken Isles), Margoss's Retreat. Dalaran (Northrend), Underbelly
	167708, 	--Ancient Mana Fin - Suramar. Suramar City Harbour
	167709, 	--Drowned Goldfish
	167710, 	--Barbed Fjord Fin - Howling Fjord, Valgarde
	167711, 	--Dead Fel Bone - Argus, seems to be Krokuun only
	167712, 	--Rotted Blood Cod - Nazmir, Zul'Nazman
	167713, 	--Veiled Ghost - Only seen while dead
	167714, 	--Travelling Goby
	167715, 	--Elusive Moonfish - Night only. 6pm to 6am
	167716, 	--Unseen Mimmic
	167717, 	--Camouflaged Snark
	167718, 	--Collectable Saltfin
	167719, 	--Golden Sunsoaker - Day only. 6am to 6pm
	167720, 	--Very Tiny Whale
	167721, 	--Invisible Smelt
	167722, 	--Prisoner Fish - Tol Barad swamp area on the western side of the island
	167723, 	--Thunderous Flounder - Isle of Thunder
	167724, 	--Tortollan Tank Dweller - Drustvar, under Anyport in the underwater Tortotallon bar called 'The Drunk Tank'
	167725, 	--Spiritual Salmon - Only seen while dead
	167726, 	--Quiet Floater - Only seen while dead
	167727, 	--Deadeye Wally - Only seen while dead
	167728, 	--Queen's Delight - Nazjatar
	167729, 	--Deceptive Maw
	167730, 	--Inconspicuous Catfish
	168016, 	--Hyper-Compressed Ocean - Toy, summons water sphere can fish in
	--168262, 	--Sentry Fish
	168302, 	--Viper Fish
	168646, 	--Mauve Stinger
	169870, 	--Displaced Scrapfin
	169884, 	--Green Roughy
	169897, 	--Thin Air Flounder
	169898, 	--Well Lurker
}

local function MatchIDs_Init(self)
	wipe(Result)

	if self.db.profile.movePoles then
		AddToSet(Result, poles)
	end

	if self.db.profile.moveHats then
		AddToSet(Result, hats)
	end

	if self.db.profile.moveBoots then
		AddToSet(Result, boots)
	end

	if self.db.profile.moveEnchants then
		AddToSet(Result, enchants)
	end

	if self.db.profile.moveBobbers then
		AddToSet(Result, bobbers)
	end

	if self.db.profile.moveLures then
		AddToSet(Result, lures)
	end

	if self.db.profile.moveConsumables then
		AddToSet(Result, consumables)
	end

	if self.db.profile.moveToys then
		AddToSet(Result, toys)
	end

	if self.db.profile.moveHeirlooms then
		AddToSet(Result, heirlooms)
	end

	if self.db.profile.moveUsables then
		AddToSet(Result, usables)
	end

	if self.db.profile.moveNatMoP then
		AddToSet(Result,natMoP)
	end

	if self.db.profile.moveWodBaits then
		AddToSet(Result, wodBait)
	end

	if self.db.profile.moveLunkers then
		AddToSet(Result, lunkers)
	end

	if self.db.profile.moveCurrency then
		AddToSet(Result, currency)
	end

	if self.db.profile.moveQuestBags then
		AddToSet(Result, questBags)
	end

	if self.db.profile.moveLegionBait then
		AddToSet(Result, legionBait)
	end

	if self.db.profile.moveLegionWellBait then
		AddToSet(Result, legionWellBait)
	end

	if self.db.profile.moveLegionArtifact then
		AddToSet(Result, legionArtifact)
	end

	if self.db.profile.moveLegionRareFish then
		AddToSet(Result, legionRareFish)
	end

	if self.db.profile.moveFishFriends then
		AddToSet(Result, fishFriends)
	end

	if self.db.profile.moveBfaFish then
		AddToSet(Result, bfaFish)
	end

	if self.db.profile.moveBfaItems then
		AddToSet(Result, bfaItems)
	end

	return Result
 end

local function Tooltip_Init()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1, 6 do
		local Left, Right = tip:CreateFontString(), tip:CreateFontString()
		Left:SetFontObject(GameFontNormal)
		Right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(Left, Right)
		leftside[i] = Left
	end
	tip.leftside = leftside
	return tip
end

local setFilter = AdiBags:RegisterFilter("Fishing Items", 98, "ABEvent-1.0")
setFilter.uiName = L["Fishing Items"]
setFilter.uiDesc = L["Fishing Items and Fishing Accessories."]

function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace("Fishing Items", {
		profile = {
			movePoles = true,
			moveHats = true,
			moveBoots = true,
			moveEnchants = true,
			moveBobbers = true,
			moveLures = true,
			moveConsumables = true,
			moveToys = true,
			moveHeirlooms = true,
			moveUsables = true,
			moveNatMoP = true,
			moveWodBaits = true,
			moveLunkers = true,
			moveCurrency = true,
			moveQuestBags = true,
			moveLegionBait = true,
			moveLegionWellBait = true,
			moveLegionArtifact = true,
			moveLegionRareFish = true,
			moveFishFriends = true,
			moveBfaFish = true,
			moveBfaItems = true,
		}
	})
end

function setFilter:Update()
	MatchIDs = nil
	self:SendMessage("AdiBags_FiltersChanged")
end

function setFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function setFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function setFilter:Filter(slotData)
	MatchIDs = MatchIDs or MatchIDs_Init(self)
	if MatchIDs[slotData.itemId] then
		return L["Fishing Items"]
	end

	Tooltip = Tooltip or Tooltip_Init()
	Tooltip:SetOwner(UIParent,"ANCHOR_NONE")
	Tooltip:ClearLines()

	if slotData.bag == BANK_CONTAINER then
		Tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		Tooltip:SetBagItem(slotData.bag, slotData.slot)
	end

	Tooltip:Hide()
end

function setFilter:GetOptions()
	return {
		movePoles = {
			name = L["Fishing Poles"],
			desc = L["Display Fishing Poles"],
			type = "toggle",
			order = 10
		},
		moveHats = {
			name = L["Fishing Hats"],
			desc = L["Display Fishing Hats"],
			type = "toggle",
			order = 20
		},
		moveBoots = {
			name = L["Fishing Boots"],
			desc = L["Display Fishing Boots"],
			type = "toggle",
			order = 30
		},
		moveEnchants = {
			name = L["Fishing Enchantments"],
			desc = L["Items that enchant fishing poles or gloves"],
			type = "toggle",
			order = 40
		},
		moveBobbers =  {
			name = L["Fishing bobbers"],
			desc = L["Items that change the look of your Bobber"],
			type = "toggle",
			order = 50
		},
		moveLures =  {
			name = L["Fishing Lures"],
			desc = L["Temporary pole enchantments"],
			type = "toggle",
			order = 60
		},
		moveConsumables =  {
			name = L["Consumables"],
			desc = L["Items that are fishing related and consumed on use"],
			type = "toggle",
			order = 70
		},
		moveToys =  {
			name = L["Toy Box Items"],
			desc = L["Fishing related items located in the Toy box"],
			type = "toggle",
			order = 80
		},
		moveHeirlooms =  {
			name = L["Fishing Heirlooms"],
			desc = L["Display fishing heirlooms"],
			type = "toggle",
			order = 90
		},
		moveUsables =  {
			name = L["Usable Fishing Items"],
			desc = L["Items in bag with /use ability"],
			type = "toggle",
			order = 100
		},
		moveNatMoP = {
			name = L["Nat Pagel Rep Items"],
			desc = L["Rep items for Nat from Pandaria"],
			type = "toggle",
			order = 110
		},
		moveWodBaits =  {
			name = L["Warlords Baits"],
			desc = L["Bait for Dreanor fish"],
			type = "toggle",
			order = 120
		},
		moveLunkers =  {
			name = L["Warlords Lunkers"],
			desc = L["Rare fish for Dreanor Nat Rep"],
			type = "toggle",
			order = 130
		},
		moveCurrency =  {
			name = L["Fishing Currencies in Bag"],
			desc = L["Fishing currencies that take bag space"],
			type = "toggle",
			order = 140
		},
		moveQuestBags =  {
			name = L["Quest Reward Bags"],
			desc = L["Fishing Daily reward bags"],
			type = "toggle",
			order = 150
		},
		moveLegionBait =  {
			name = L["Legion Baits"],
			desc = L["Bait for Legion Rare fish"],
			type = "toggle",
			order = 160
		},
		moveLegionWellBait =  {
			name = L["Legion Baits for Dalaran Well"],
			desc = L["Bait to get certain Dalaran Well coins"],
			type = "toggle",
			order = 170
		},
		moveLegionArtifact =  {
			name = L["Artifact Pole Quest Items"],
			desc = L["Items for the Underlight Angler questline"],
			type = "toggle",
			order = 180
		},
		moveLegionRareFish =  {
			name = L["Legion Rare Fish"],
			desc = L["Rare fish for increasing Legion fishing skill or add AP to Underlight Angler"],
			type = "toggle",
			order = 190
		},
		moveFishFriends =  {
			name = L["Fishing Friends Currency"],
			desc = L["Currencies for Legion Fishing Friends"],
			type = "toggle",
			order = 200
		},
		moveBfaFish =  {
			name = L["BFA Items"],
			desc = L["Fishing items from BFA Zones"],
			type = "toggle",
			order = 210
		},
		moveBfaItems =  {
			name = L["BFA 8.2 Items"],
			desc = L["Fishing items from BFA 8.2 Zones"],
			type = "toggle",
			order = 220
		},
	},
	AdiBags:GetOptionHandler(self, false, function()
		return self:Update()
	end)
end
