
print("[FUSE] --------------------LOADING FUSE--------------------\n")

AddCSLuaFile("api/apiloader.lua")
include("api/apiloader.lua")
AddCSLuaFile("gui/guiloader.lua")
include("gui/guiloader.lua")
AddCSLuaFile("modules/moduleloader.lua")
include("modules/moduleloader.lua")

fuse.print("--------------------FUSE LOADED--------------------\n")
