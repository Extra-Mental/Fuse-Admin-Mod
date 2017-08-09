AddCSLuaFile()

fuse = {} --Defining api globally

local function LoadMessage(Msg)
  print("[FUSE] " .. Msg)
end

LoadMessage("LOADING FUSE API")

--Load Shared API files
LoadMessage("  SHARED")
local files = file.Find( "fuse/api/shared/*", "LUA")

for k, v in pairs(files) do
  LoadMessage("    "..v)
  AddCSLuaFile("shared/"..v)
  include("shared/"..v)
end

if SERVER then
  LoadMessage("  SERVER")
  local files = file.Find( "fuse/api/server/*", "LUA")

  for k, v in pairs(files) do
    LoadMessage("    "..v)
    include("server/"..v)
  end
end

LoadMessage("  CLIENT")
local files = file.Find( "fuse/api/client/*", "LUA")

for k, v in pairs(files) do
  LoadMessage("    "..v)
  if SERVER then AddCSLuaFile("client/"..v) end
  if CLIENT then include("client/"..v) end
end

LoadMessage("FUSE API LOADED\n")
