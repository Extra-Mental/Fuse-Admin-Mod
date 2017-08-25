local ScrW = ScrW()
local ScrH = ScrH()

local PlayerListWindow
local PlyListContainer

fuseui.RefreshPlyList = function()

  if not PlayerListWindow then return end
  if not PlyListContainer then fuse.print("No Derma Panel to update") return end

  PlyListContainer:Clear()

  for k, Ply in pairs( player.GetAll() ) do
    local PlyContainer = vgui.Create( "DPanel", PlyListContainer)
    PlyContainer:Dock(TOP)
    PlyContainer:SetHeight(ScrH/25)
    PlyContainer:SetWidth(PlyContainer:GetWide())
    PlyContainer:DockPadding( 0, 0, 0, 0)

    local PlyAvatar = fuse.getPlyAvatar(Ply, PlyContainer)
    PlyAvatar:SetPos(0, 0)
    PlyAvatar:SetSize(ScrH/25, ScrH/25)

    local PlyNameButton = vgui.Create( "DButton", PlyContainer)
    PlyNameButton:SetText( Ply:Nick() )
    PlyNameButton:SetPos(ScrH/25,0)
    PlyNameButton:SetSize( ScrW/11, ScrH/25)
    PlyNameButton.DoClick = function()
      fuseui.OpenProfileMenu(Ply)
    end
    PlyNameButton.Paint = function( self, w, h )
      if not Ply:IsValid() then return end
      local Gray = 250-((k%2)*50)
      draw.RoundedBox( 0, 0, 0, w, h, Color(Gray,Gray,Gray))
      draw.RoundedBox( 0, 0, 0, 7.5, h, team.GetColor(Ply:Team()))
    end

  end
end
net.Receive("fuse_PlyListUpdate", function()
  fuseui.RefreshPlyList()
end)

local function CreateMenu()

  PlayerListWindow = vgui.Create( "DFrame" )
  PlayerListWindow:SetPos( 0, ScrH/6)
  PlayerListWindow:SetSize( ScrW/9, ScrH/1.5)
  PlayerListWindow:DockPadding( 0, ScrH/25, 0, 0)
  PlayerListWindow:SetTitle( "[FUSE]")
  PlayerListWindow:ShowCloseButton(false)
  PlayerListWindow:MakePopup()
  PlayerListWindow:SetKeyboardInputEnabled(false)

  PlayerListWindow.Paint = function( self, w, h)
    draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,200))
    draw.RoundedBox( 0, 0, 0, PlayerListWindow:GetWide(), ScrH/25, Color(20,20,20))
  end

  local CloseButton = vgui.Create( "DButton" , PlayerListWindow)
  CloseButton:SetSize( ScrH/25, ScrH/25)
  CloseButton:SetPos(PlayerListWindow:GetWide()-(ScrH/25)+1, 0)
  CloseButton:SetText("")
  CloseButton.DoClick = function()
    PlayerListWindow:Hide()
  end

  local CloseIcon = Material( "vgui/white_x.png" )
  CloseButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, fuse.ColourMultiply(Color(255,0,0),CloseButton:IsHovered()))
    surface.SetDrawColor(Color(255,255,255,255))
    surface.SetMaterial(CloseIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local SettingsButton = vgui.Create( "DButton" , PlayerListWindow)
  SettingsButton:SetSize( ScrH/25, ScrH/25)
  SettingsButton:SetPos(PlayerListWindow:GetWide()-(ScrH/25)*2+1, 0)
  SettingsButton:SetText("")
  SettingsButton.DoClick = function()
  end

  local SettingsIcon = Material( "vgui/gear.png" )
  SettingsButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, fuse.ColourMultiply(Color(100,100,100),SettingsButton:IsHovered()))
    surface.SetDrawColor(Color(255,255,255,255))
    surface.SetMaterial(SettingsIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  PlyListContainer = vgui.Create( "DScrollPanel" , PlayerListWindow)
  PlyListContainer:Dock(FILL)
  PlyListContainer:DockPadding( 0, 0, 0, 0)
  PlyListContainer:SetVerticalScrollbarEnabled(true)

  fuseui.RefreshPlyList()
end

fuseui.OpenMenu = function()

  if PlayerListWindow then
    PlayerListWindow:Show()
    for k, Menu in pairs( fuseui.ProfileMenus ) do
      Menu:Show()
    end
    return
  end

  CreateMenu()

end

fuseui.CloseMenu = function()

  if PlayerListWindow then
    PlayerListWindow:Hide()
    for k, Menu in pairs( fuseui.ProfileMenus ) do
      Menu:Hide()
    end
   end

end

fuseui.ToggleMenu = function()

  if PlayerListWindow then
    if PlayerListWindow:IsVisible() then
      fuseui.CloseMenu()
    else
      fuseui.OpenMenu()
    end
    return
  end

  CreateMenu()

end
