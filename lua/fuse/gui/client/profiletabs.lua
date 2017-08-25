local ScrW = ScrW()
local ScrH = ScrH()

local PreMenuTab = {}

fuseui.ProfileMenuPly = null

fuseui.ProfileMenuAddTab = function(Icon, Name, Function)

  table.insert( PreMenuTab, {Icon, Name, Function} )

end

fuseui.ProfileMenuAddTab("icon16/information.png", "Stats", function()

  local PlyStats = vgui.Create( "DPanel", Tabs)
  PlyStats.Paint = function( self, w, h)
    draw.RoundedBox( 0, 0, 0, w, h, Color(200,200,200,200))
  end

  local Stats = {"Props", "Ragdolls", "Thrusters", "SENTs", "Vehicles", "Npcs", "Lamps"}

  surface.CreateFont("fuseuistatsfont", { font = "Trebuchet24", size = ScrH/60, weight = 800, antialiasing = true} )

  for k, Stat in pairs( Stats ) do
      local Label = vgui.Create( "DLabel", PlyStats)
      Label:SetFont("fuseuistatsfont")
      Label:SetTextColor(Color( 0, 0, 0, 255 ))
      Label:SetText(Stat ..": ".. fuseui.ProfileMenuPly:GetCount(Stat))
      Label:SetPos(ScrH/90,(k*ScrH/60)-ScrH/60)
      Label:SetSize(200,ScrH/60)
  end

  return PlyStats

end)

hook.Add( "fuseui_createtabs", "fuseui_createtabs", function(ProfileMenu, Ply)

  local Tabs = vgui.Create( "DPropertySheet", ProfileMenu)
  Tabs:DockPadding( 0, 0, 0, 0)
  Tabs:DockMargin( 0, 0, 0, 0)
  Tabs:Dock(FILL)
  Tabs.Paint = function( self, w, h)
    --draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0,100))
  end

  fuseui.ProfileMenuPly = Ply

  for k, v in pairs(PreMenuTab) do
    local Icon = v[1]
    local Name = v[2]
    local Panel = v[3]()
    Tabs:AddSheet( Name, Panel, Icon )
  end

--[[

  local PlyStats = vgui.Create( "DPanel", Tabs)
  PlyStats.Paint = function( self, w, h)
    draw.RoundedBox( 0, 0, 0, w, h, Color(200,200,200,200))
  end

  local Stats = {"Props", "Ragdolls", "Thrusters", "SENTs", "Vehicles", "Npcs", "Lamps"}

  surface.CreateFont("fuseuistatsfont", { font = "Trebuchet24", size = ScrH/60, weight = 800, antialiasing = true} )

  for k, Stat in pairs( Stats ) do
      local Label = vgui.Create( "DLabel", PlyStats)
      Label:SetFont("fuseuistatsfont")
      Label:SetTextColor(Color( 0, 0, 0, 255 ))
      Label:SetText(Stat ..": ".. Ply:GetCount(Stat))
      Label:SetPos(ScrH/90,(k*ScrH/60)-ScrH/60)
      Label:SetSize(200,ScrH/60)
  end

  Tabs:AddSheet( "Stats", PlyStats, "icon16/information.png" )

  ]]

  for k, v in pairs(Tabs.Items) do
	   if (!v.Tab) then continue end

	 v.Tab.Paint = function(self,w,h)
     if v.Tab:IsActive() then
		  draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0,200))
    end
	 end
  end

end)
