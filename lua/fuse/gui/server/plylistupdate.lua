
util.AddNetworkString("fuse_PlyListAdd")

hook.Add( "PlayerInitialSpawn", "fuse_add_ply", function(Ply)

  timer.Simple( 1, function()
    net.Start("fuse_PlyListAdd")
    net.WriteEntity(Ply)
    net.Broadcast()
  end)

end)
