AddCSLuaFile()

if not fuse then
  print("[FUSE GUI] ERROR: FUSE API NOT PRESENT")
end

fuse.gui = {} --Make GUI API extension

fuse.print("LOADING FUSE GUI")

--Load Shared API files
fuse.print("  SHARED")
local files = file.Find( "fuse/gui/shared/*", "LUA")

for k, v in pairs(files) do
  fuse.print("    "..v)
  AddCSLuaFile("shared/"..v)
  include("shared/"..v)
end

if SERVER then
  fuse.print("  SERVER")
  local files = file.Find( "fuse/gui/server/*", "LUA")

  for k, v in pairs(files) do
    fuse.print("    "..v)
    include("server/"..v)
  end
end

fuse.print("  CLIENT")
local files = file.Find( "fuse/gui/client/*", "LUA")

for k, v in pairs(files) do
  fuse.print("    "..v)
  if SERVER then AddCSLuaFile("client/"..v) end
  if CLIENT then include("client/"..v) end
end

fuse.print("FUSE GUI LOADED\n")
