
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

local TileWindowsThinkFuncs = {}
local function TileWindowsThink(Func)
  table.insert(TileWindowsThinkFuncs, Func)
end

fuseui.ApplyTilesToButton = function(PlyButton, Target)

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
      TileButton:SetTooltip(TileData.Tooltip)
      TileButton.DoClick = function()
        TileData.LClickFunction(TileButton, Target)
      end
      TileButton.Paint = function( self, W, H )
        TileData.Paint(TileButton, W, H)
      end

    end

    local ThinkFunc = function()
      if not PlyButton:IsValid() then Frame:Remove() return true end
      local X, Y = Frame:CursorPos()
      if PlyButton:IsHovered() then -- Make it visible if hovered no matter what
        Frame:SetVisible(true)
        Frame:SetPos(PlyButton:LocalToScreen(PlyButton:GetWide()-4,0))
        return false
      end
      if PlyButton:IsVisible() and Frame:IsVisible() and BetweenVectors(X, Y, 0, Frame:GetWide(), 0, Frame:GetTall()) then
        Frame:SetVisible(true)
        Frame:SetPos(PlyButton:LocalToScreen(PlyButton:GetWide()-4,0))
        return false
      end
      Frame:SetVisible(false)
    end

    TileWindowsThink(ThinkFunc)

  end)

end

local function onThink()

  for k, v in pairs(TileWindowsThinkFuncs) do
	   DeleteFunc = v()
     if DeleteFunc then table.remove(TileWindowsThinkFuncs, k) end
  end

end

hook.Add( "Think", "fusegui_tiles", onThink )
