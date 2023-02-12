local name, stuff = ...

stuff['nodes'] = { }
nodes = stuff['nodes']

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
if not HandyNotes then return end
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes_FlightMasters (Classic)")

local iconDefault = "Interface\\MINIMAP\\TRACKING\\FlightMaster"
local iconUndiscovered = "Interface\\Addons\\HandyNotes_FlightMasters (Classic)\\flightmaster_undiscovered.tga"

local db, learned
local _, class, faction


local pluginHandler = { }
function pluginHandler:OnEnter(uiMapId, coord)
    local nodeData = nil
	
    --if (not nodes[mapFile][coord]) then return end
	if (nodes[uiMapId] and nodes[uiMapId][coord]) then
	 nodeData = nodes[uiMapId][coord]
	end
	
	if (not nodeData) then
		--print('No node data for', uiMapId, coord)
		return
	end
	
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

    if (not nodeData.name) then return end
	tooltip:AddLine(nodeData.name)
	if (nodeData.npcName) then
		tooltip:AddLine(nodeData.npcName, 0, 0.6, 0.1)
	end
	tooltip:Show()
end

function pluginHandler:OnLeave(mapFile, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

do
	local tablepool = setmetatable({}, {__mode = 'k'})

	local function iter(t, prestate)
		if not t then return end
		local data = t.data

		local state, value = next(data, prestate)

		while(state) do
			if value then
				if (value.faction == faction or value.faction == "Neutral")  and (not value.classes or value.classes[class]) then
					local icon = iconDefault
					-- I don't have a check for if the druids have "unlocked" their flight masters so just consider them discovered
					if db.undiscovered and not (value.classes and value.classes[class]) then
						icon = learned[value.name] and iconDefault or iconUndiscovered
					end
					return state, nil, icon, db.zoneScale, db.zoneAlpha
				end
			end
			state, value = next(data, state)
		end
		wipe(t)
		tablepool[t] = true
	end


	local function iterCont(t, prestate)
		if not t then return end
		if not db.continent then return end
		local zone = t.C[t.Z]
		local data = nodes[zone]
		local state, value
		while zone do
			if data then -- Only if there is data for this zone
				state, value = next(data, prestate)
				while state do -- Have we reached the end of this zone?
					if (value.faction == faction or value.faction == "Neutral") and (not value.hideOnContinent or zone == t.contId)   and (not value.classes or value.classes[class]) then -- Show on continent?
						local icon = iconDefault
						if db.undiscovered and not (value.classes and value.classes[class]) then
							icon = learned[value.name] and iconDefault or iconUndiscovered
						end
						return state, zone, icon, db.continentScale, db.continentAlpha
					end
					state, value = next(data, state) -- Get next data
				end
			end
			-- Get next zone
			t.Z = next(t.C, t.Z)
			zone = t.C[t.Z]
			data = nodes[zone]
			prestate = nil
		end
		wipe(t)
		tablepool[t] = true
	end

	function pluginHandler:GetNodes2(uiMapId, isMinimapUpdate)
		--print(uiMapId)
		local C = HandyNotes:GetContinentZoneList(uiMapId) -- Is this a continent?
		if C then
			local tbl = next(tablepool) or {}
			tablepool[tbl] = nil
			tbl.C = C
			tbl.Z = next(C)
			tbl.contId = uiMapId

			return iterCont, tbl, nil
		else -- It is a zone
			if (nodes[uiMapId] == nil) then return iter end -- Throws error if I don't do this
			--print('zone')
			local tbl = next(tablepool) or {}
			tablepool[tbl] = nil

			tbl.data = nodes[uiMapId]

			return iter, tbl, nil
		end
	end
end

local waypoints = {}
local function setWaypoint(mapFile, coord)
	if not TomTom then return end
	local x, y = HandyNotes:getXY(coord)
	TomTom:AddWaypoint(mapFile, x, y, {
		title = nodes[mapFile][coord].name,
		persistent = nil,
		minimap = true,
		world = true
	})
end

function pluginHandler:OnClick(button, pressed, mapFile, coord)
	if (not pressed) then return end
 --print(button, pressed, mapFile, coord)
	if (button == "RightButton" and db.tomtom and TomTom) then
		setWaypoint(mapFile, coord)
		return
	end
end

local defaults = {
	profile = {
		zoneScale = 1,
		zoneAlpha = 1,
		continentScale = 1,
		continentAlpha = 1,
		continent = true,
		tomtom = true,
		undiscovered = true,
	},
	char = {
		learned = {
			['*'] = false,
		}
	},
}

local Addon = CreateFrame("Frame")
Addon:RegisterEvent("PLAYER_LOGIN")
Addon:SetScript("OnEvent", function(self, event, ...) return self[event](self, ...) end)

local function updateStuff()
	HandyNotes:SendMessage("HandyNotes_NotifyUpdate", "FlightMasters")
end

function Addon:PLAYER_ENTERING_WORLD()
	faction = UnitFactionGroup("player")
	_, class = UnitClass("player")
	updateStuff()
end

function Addon:TAXIMAP_OPENED()
	taxiNodes = C_TaxiMap.GetAllTaxiNodes(GetTaxiMapID())
	for k, v in pairs(taxiNodes) do
		if v.state == Enum.FlightPathState.Unreachable then
			self.db.char.learned[v.name] = false
		else
			self.db.char.learned[v.name] = true
		end
	end
	updateStuff()
end

function Addon:PLAYER_LOGIN()
 local options = {
 type = "group",
 name = "FlightMasters",
 desc = "Locations of flightmasters.",
 get = function(info) return db[info[#info]] end,
 set = function(info, v) db[info[#info]] = v HandyNotes:SendMessage("HandyNotes_NotifyUpdate", "FlightMasters") end,
 args = {
  desc = {
   name = L["These settings control the look and feel of the icon."],
   type = "description",
   order = 0,
  },
  zoneScale = {
   type = "range",
   name = L["Zone Scale"],
   desc = L["The scale of the icons shown on the zone map"],
   min = 0.2, max = 12, step = 0.1,
   order = 10,
  },
  zoneAlpha = {
   type = "range",
   name = L["Zone Alpha"],
   desc = L["The alpha of the icons shown on the zone map"],
   min = 0, max = 1, step = 0.01,
   order = 20,
  },
  continentScale = {
   type = "range",
   name = L["Continent Scale"],
   desc = L["The scale of the icons shown on the continent map"],
   min = 0.2, max = 12, step = 0.1,
   order = 10,
  },
  continentAlpha = {
   type = "range",
   name = L["Continent Alpha"],
   desc = L["The alpha of the icons shown on the continent map"],
   min = 0, max = 1, step = 0.01,
   order = 20,
  },
  continent = {
   type = "toggle",
   name = L["Show on Continent"],
   desc = L["Show icons on continent map"],
   order = 1,
  },
  tomtom = {
   type = "toggle",
   name = L["Enable TomTom integration"],
   desc = L["Allow right click to create waypoints with TomTom"],
   order = 2,
  },
  undiscovered = {
	type = "toggle",
	name = L["Show Undiscovered"],
	desc = L["Use a different icon for undiscovered flightmasters"],
	order = 2.1,
  },
 },
}

 HandyNotes:RegisterPluginDB("FlightMasters", pluginHandler, options)
 self.db = LibStub("AceDB-3.0"):New("HandyNotes_FlightMastersClassicDB", defaults, true)
 db = self.db.profile
 learned = self.db.char.learned
 
 Addon:RegisterEvent("PLAYER_ENTERING_WORLD")
 Addon:RegisterEvent("TAXIMAP_OPENED")
end