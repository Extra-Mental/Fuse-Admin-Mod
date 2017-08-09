
print("[FUSE] --------------------LOADING FUSE--------------------\n")

AddCSLuaFile("api/apiloader.lua")
include("api/apiloader.lua")
AddCSLuaFile("gui/guiloader.lua")
include("gui/guiloader.lua")
AddCSLuaFile("core/coreloader.lua")
include("core/coreloader.lua")

fuse.print("--------------------FUSE LOADED--------------------\n")
