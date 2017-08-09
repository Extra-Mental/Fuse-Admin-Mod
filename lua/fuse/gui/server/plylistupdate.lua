
util.AddNetworkString("fuse_PlyListUpdate")

local function ConEvent()
  net.Start("fuse_PlyListUpdate")
  net.Broadcast()
end

hook.Add( "PlayerInitialSpawn", "fuse_refresh_spawn", function()
  timer.Simple( 0.5, ConEvent())
end)
hook.Add( "PlayerDisconnected", "fuse_refresh_disconnect", ConEvent)
