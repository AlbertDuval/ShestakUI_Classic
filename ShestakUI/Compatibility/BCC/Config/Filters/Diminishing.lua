local T, C, L, _ = unpack(select(2, ...))
if not T.BCC or C.unitframe.enable ~= true or C.unitframe.show_arena ~= true or C.unitframe.plugins_diminishing ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Sap -> http://www.wowhead.com/spell=6770
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
T.DiminishingSpells = {
	-- Stuns
	[5211] = {"stun"},				-- Bash
	[9005] = {"stun"},				-- Pounce
	[24394] = {"stun"},				-- Intimidation
	[853] = {"stun"},				-- Hammer of Justice
	[1833] = {"stun"},				-- Cheap Shot
	[22703] = {"stun"},				-- Inferno Effect
	[30283] = {"stun"},				-- Shadowfury
	[7922] = {"stun"},				-- Charge Stun
	[12809] = {"stun"},				-- Concussion Blow
	[20253] = {"stun"},				-- Intercept Stun
	[20549] = {"stun"},				-- War Stomp (Racial)
	[835] = {"stun"},				-- Tidal Charm
	[4064] = {"stun"},				-- Rough Copper Bomb
	[4065] = {"stun"},				-- Large Copper Bomb
	[4066] = {"stun"},				-- Small Bronze Bomb
	[4067] = {"stun"},				-- Big Bronze Bomb
	[4068] = {"stun"},				-- Iron Grenade
	[4069] = {"stun"},				-- Big Iron Bomb
	[12421] = {"stun"},				-- Mithril Frag Bomb
	[12543] = {"stun"},				-- Hi-Explosive Bomb
	[12562] = {"stun"},				-- The Big One
	[13237] = {"stun"},				-- Goblin Mortar
	[13808] = {"stun"},				-- M73 Frag Grenade
	[19769] = {"stun"},				-- Thorium Grenade
	[19784] = {"stun"},				-- Dark Iron Bomb
	[30216] = {"stun"},				-- Fel Iron Bomb
	[30461] = {"stun"},				-- The Bigger One
	[30217] = {"stun"},				-- Adamantite Grenade

	--[[
	-- Stun Procs
	[16922] = {"stunproc"},			-- Celestial Focus
	[19410] = {"stunproc"},			-- Improved Concussive Shot
	[12355] = {"stunproc"},			-- Impact
	[15269] = {"stunproc"},			-- Blackout
	[20170] = {"stunproc"},			-- Seal of Justice
	[39796] = {"stunproc"},			-- Stoneclaw Totem
	-- [18093] = {"stunproc"},			-- Pyroclasm
	[12798] = {"stunproc"},			-- Revenge Stun
	[5530] = {"stunproc"},			-- Mace Specialization
	[56] = {"stunproc"},			-- Stun (The Chief's Enforcer / Bludgeon of the Grinning Dog / The Judge's Gavel / Hammer of the Titans)
	[15283] = {"stunproc"},			-- Stunning Blow (Dark Iron Pulverizer)
	[21152] = {"stunproc"},			-- Earthshaker (Earthshaker)
	--]]

	-- Disorients
	[22570] = {"disorient"},		-- Maim
	[118] = {"disorient"},			-- Polymorph
	[28272] = {"disorient"},		-- Polymorph: Pig
	[28271] = {"disorient"},		-- Polymorph: Turtle
	[1776] = {"disorient"},			-- Gouge
	[6770] = {"disorient"},			-- Sap
	[13327] = {"disorient"},		-- Reckless Charge (Horned Viking Helmet / Goblin Rocket Helmet)
	[26108] = {"disorient"},		-- Glimpse of Madness (Dark Edge of Insanity)

	-- Sleeps
	[2637] = {"sleep"},				-- Hibernate
	[19386] = {"sleep"},			-- Wyvern Sting

	-- Charms
	[605] = {"charm"},				-- Mind Control

	-- Fears
	[1513] = {"fear"},				-- Scare Beast
	[8122] = {"fear"},				-- Psychic Scream
	[5782] = {"fear"},				-- Fear
	[5484] = {"fear"},				-- Howl of Terror
	[6358] = {"fear"},				-- Seduction (Succubus)
	[5246] = {"fear"},				-- Intimidating Shout
	[5134] = {"fear"},				-- Flash Bomb (Flash Bomb)

	-- Horrors
	[6789] = {"horror"},			-- Death Coil

	-- Unstable Affliction
	[43523] = {"ua"},				-- Unstable Affliction

	-- Roots
	-- [45334] = {"root"},				-- Feral Charge Effect
	[339] = {"root"},				-- Entangling Roots
	[19975] = {"root"},				-- Entangling Roots (Nature's Grasp)
	[19306] = {"root"},				-- Counterattack
	[19185] = {"root"},				-- Entrapment
	-- [19229] = {"root"},				-- Improved Wing Clip
	[33395] = {"root"},				-- Freeze (Water Elemental)
	[122] = {"root"},				-- Frost Nova
	-- [12494] = {"root"},				-- Frostbite
	[44041] = {"root"},				-- Chastise
	-- [23694] = {"root"},				-- Improved Hamstring
	-- [27868] = {"root"},				-- Freeze (Magister's Regalia / Sorcerer's Regalia / Deadman's Hand)
	[39965] = {"root"},				-- Frost Grenade

	--[[
	-- Disarms
	[14251] = {"disarm"},			-- Riposte
	[676] = {"disarm"},				-- Disarm
	--]]

	--[[
	-- Silences
	[34490] = {"silence"},			-- Silencing Shot
	[18469] = {"silence"},			-- Counterspell - Silenced
	[15487] = {"silence"},			-- Silence
	[1330] = {"silence"},			-- Garrote - Silence
	[18425] = {"silence"},			-- Kick - Silenced
	[24259] = {"silence"},			-- Spell Lock (Felhunter)
	-- [31117] = {"silence"},			-- Unstable Affliction (Silence)
	[18498] = {"silence"},			-- Shield Bash - Silenced
	[28730] = {"silence"},			-- Arcane Torrent (Mana)
	[25046] = {"silence"},			-- Arcane Torrent (Energy)
	-- [44835] = {"silence"},			-- Maim Interrupt (incorrect spellID)
	[32747] = {"silence"},			-- Deadly Throw Interrupt
	--]]

	-- Mind Control
	[605] = {"mindcontrol"},		-- Mind Control
	[13181] = {"mindcontrol"},		-- Gnomish Mind Control Cap

	-- Cyclone / Blind
	[33786] = {"cycloneblind"},		-- Cyclone
	[2094] = {"cycloneblind"},		-- Blind

	-- Freezing Trap
	[3355] = {"freezingtrap"},		-- Freezing Trap

	-- Scatter Shot
	[19503] = {"scattershot"},		-- Scatter Shot

	-- Dragon's Breath
	[31661] = {"dragonsbreath"},	-- Dragon's Breath

	-- Repentence
	[20066] = {"repentance"},		-- Repentance

	--[[
	-- Turn Evil / Turn Undead
	[10326] = {"turned"},			-- Turn Evil
	[2878] = {"turned"},			-- Turn Undead
	--]]

	--[[
	-- Shackle Undead
	[9484] = {"shackle"},			-- Shackle Undead
	--]]

	-- Kidney Shot
	[408] = {"kidneyshot"},			-- Kidney Shot

	-- Frost Shock
	[8056] = {"frostshock"},		-- Frost Shock
}

local function GetIcon(id)
	local _, _, icon = GetSpellInfo(id)
	return icon
end

T.DiminishingIcons = {
	["stun"] = GetIcon(853),
	-- ["stunproc"] = GetIcon(5530),
	["disorient"] = GetIcon(118),
	["sleep"] = GetIcon(19386),
	["charm"] = GetIcon(605),
	["fear"] = GetIcon(8122),
	["horror"] = GetIcon(5782),
	["ua"] = GetIcon(43523),
	["root"] = GetIcon(339),
	-- ["disarm"] = GetIcon(676),
	-- ["silence"] = GetIcon(15487),
	["mindcontrol"] = GetIcon(605),
	["cycloneblind"] = GetIcon(33786),
	["freezingtrap"] = GetIcon(3355),
	["scattershot"] = GetIcon(19503),
	["dragonsbreath"] = GetIcon(31661),
	["repentance"] = GetIcon(20066),
	-- ["turned"] = GetIcon(10326),
	-- ["shackle"] = GetIcon(9484),
	["kidneyshot"] = GetIcon(408),
	["frostshock"] = GetIcon(8056),
}
