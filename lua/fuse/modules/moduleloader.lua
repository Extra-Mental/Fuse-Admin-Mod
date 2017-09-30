AddCSLuaFile()

fuse.print("LOADING MODULES")

--Load Shared API files
fuse.print("  SHARED")
local files = file.Find( "fuse/modules/shared/*", "LUA")

for k, v in pairs(files) do
  fuse.print("    "..v)
  AddCSLuaFile("shared/"..v)
  include("shared/"..v)
end

if SERVER then
  fuse.print("  SERVER")
  local files = file.Find( "fuse/modules/server/*", "LUA")

  for k, v in pairs(files) do
    fuse.print("    "..v)
    include("server/"..v)
  end
end

fuse.print("  CLIENT")
local files = file.Find( "fuse/modules/client/*", "LUA")

for k, v in pairs(files) do
  fuse.print("    "..v)
  if SERVER then AddCSLuaFile("client/"..v) end
  if CLIENT then include("client/"..v) end
end

fuse.print("MODULES LOADED\n")
