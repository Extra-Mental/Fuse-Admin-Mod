
local Tiles = {}
local ThisTile = 0

fuseui.NewTile = function(Tooltip, Paint)
  ThisTile = ThisTile + 1

  Tiles[ThisTile] = {Tooltip = Tooltip, Paint = Paint}

end

fuseui.TileLeftClick = function(LClickFunction)
  table.Merge(Tiles[ThisTile], {LClickFunction = LClickFunction})
end

fuseui.TileRightClick = function(RClickFunction)
  table.Merge(Tiles[ThisTile], {RClickFunction = RClickFunction})
end

local function BetweenVectors(X, Y, XMin, XMax, YMin, YMax)

  if X < XMin or X > XMax then return false end
  if Y < YMin or Y > YMax then return false end

  return true

end

fuseui.ApplyTilesToButton = function(Button, Target)

  timer.Simple( 0.1, function()
    local Frame = vgui.Create( "DFrame" )
    Frame:SetSize( 300, 150 )
    Frame:SetDraggable( false )
    Frame:DockPadding( 0, 0, 0, 0)

    Panel = vgui.Create( "DScrollPanel" , Frame)
    Panel:DockMargin( 0, 0, 0, 0)
    Panel:DockPadding( 0, 0, 0, 0)
    Panel:Dock(FILL)


    for k, TileData in pairs(Tiles) do

      local TileButton = vgui.Create( "DButton" , Panel)
      TileButton:SetSize( ScrH()/25, ScrH()/25)
      TileButton:SetText("")
      TileButton:DockMargin( 0, 0, 0, 0)
      TileButton.DoClick = function()
        TileData.LClickFunction(Button, Target)
      end
      TileButton.Paint = function( self, W, H )
        TileData.Paint(TileButton, W, H)
      end

    end

    Button.Think = function()
      local X, Y = Frame:CursorPos()
      if Button:IsHovered() or (Frame:IsVisible() and BetweenVectors(X, Y, 0, Frame:GetWide(), 0, Frame:GetTall()))  then
        Frame:SetVisible(true)
        Frame:SetPos(Button:LocalToScreen(Button:GetWide()-4,0))
        return
      end
      Frame:SetVisible(false)
    end

  end)

end
