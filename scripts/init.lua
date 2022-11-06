-- Version
ScriptHost:LoadScript("scripts/ver.lua")

-- Settings
ScriptHost:LoadScript("scripts/settings/settings.lua")

-- Auto-Tracking
ScriptHost:LoadScript("scripts/tracking/autotracking.lua")
if (string.find(Tracker.ActiveVariantUID, "items_only")) then
  ScriptHost:LoadScript("scripts/tracking/autotracking.lua")
end
if (string.find(Tracker.ActiveVariantUID, "shard_hunt")) then
  ScriptHost:LoadScript("scripts/tracking/autotracking-sh.lua")
end

-- Items
print("Loading Items")
dir = "items"
items = {
  "armor",
  "counters",
  "crystals",
  "magics",
  "party",
  "storymarkers",
  "weapons",
  "toggles"
}
for _, itemCat in ipairs(items) do
  Tracker:AddItems(dir .. "/" .. itemCat .. ".json")
end
print("")

-- Grids
print("Loading Grids")
dir = "layouts/grids"
grids = {
  "magics/blackmagics",
  "magics/whitemagics",
  "magics/wizardmagics",
  "armors",
  "coins",
  "counters",
  "crests",
  "crystals",
  "keyitems",
  "magics",
  "party",
  "storymarkers",
  "weapons",
  "grids"
}
for _, gridCat in ipairs(grids) do
  Tracker:AddLayouts(dir .. "/" .. gridCat .. ".json")
end
print("")

local variant = Tracker.ActiveVariantUID
if variant == "" then
  variant = "items_only"
end

if variant == "items_only" then
  print("Not a Map Variant; load default stuff")
  -- Layout Defaults
  Tracker:AddLayouts("layouts/broadcast.json")
  Tracker:AddLayouts("layouts/tracker.json")
  print("")
end
if variant == "shard_hunt" then
  print("Loading Shard Hunt Variant")
  -- Layout Defaults
  Tracker:AddLayouts("layouts/broadcast-sh.json")
  Tracker:AddLayouts("layouts/tracker-sh.json")
  print("")
end

-- Legacy
print("Satisfy Legacy Loads")
Tracker:AddMaps("maps/maps.json")
Tracker:AddLocations("locations/world.json")
print("")
