local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	ShestakUI variables
----------------------------------------------------------------------------------------
T.dummy = function() return end
T.name = UnitName("player")
T.race = select(2, UnitRace("player"))
T.class = select(2, UnitClass("player"))
T.level = UnitLevel("player")
T.client = GetLocale()
T.realm = GetRealmName()
T.color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[T.class]
T.version = GetAddOnMetadata("ShestakUI", "Version")
T.screenWidth, T.screenHeight = GetPhysicalScreenSize()
T.wowBuild = select(2, GetBuildInfo()); T.wowBuild = tonumber(T.wowBuild)
T.beta = select(4, GetBuildInfo())
T.classic = _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CLASSIC
T.BCC = T.classic and select(4, GetBuildInfo()) > 20500
T.HiDPI = T.classic and (GetScreenHeight() / T.screenHeight < 0.75)