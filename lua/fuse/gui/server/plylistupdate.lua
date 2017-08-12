
util.AddNetworkString("fuse_PlyListUpdate")

local function ConEvent()
  timer.Simple( 0.5, function()
    net.Start("fuse_PlyListUpdate")
    net.Broadcast()
  end)
end

hook.Add( "PlayerInitialSpawn", "fuse_refresh_spawn", ConEvent)
hook.Add( "PlayerDisconnected", "fuse_refresh_disconnect", ConEvent)
