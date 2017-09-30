fuseui.NewTile("Ban", function(Tile, W, H)

  draw.RoundedBox( 0, 0, 0, W, H, Color(255,0,0))
  surface.SetDrawColor(Color(255,255,255,255))
  surface.SetMaterial(Material("ban.png"))
  surface.DrawTexturedRect( 0, 0, W, H)

end)

fuseui.TileLeftClick(function(Button, Target)

  RunConsoleCommand("ulx", "banid", Target:SteamID(), 0, "Fuse Port Ban")

end)
