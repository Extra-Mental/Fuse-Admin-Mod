local ScrW = ScrW()
local ScrH = ScrH()

fuse.gui.ProfileMenus = {}

fuse.gui.OpenProfileMenu = function(Ply)

  if fuse.gui.ProfileMenus[Ply] then
    fuse.gui.ProfileMenus[Ply]:Show()
    return
  end

	local ProfileMenu = vgui.Create("DFrame")
	ProfileMenu:SetSize(ScrW/3.5, ScrH/3.3)
  ProfileMenu:ShowCloseButton(false)
  ProfileMenu:MakePopup()
  ProfileMenu:SetKeyboardInputEnabled(false)
  ProfileMenu.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(100,100,100,200))
    draw.RoundedBox( 0, 0, 0, ScrH/11, ScrH/11, team.GetColor(Ply:Team()))
    draw.RoundedBox( 0, 0, 0, w, ScrH/30, team.GetColor(Ply:Team()))
    surface.SetFont( "Trebuchet24" )
	  surface.SetTextColor( 0, 0, 0)
	  surface.SetTextPos( ScrH/10, ScrH/180)
	  surface.DrawText(Ply:Nick())
  end
  fuse.gui.ProfileMenus[Ply] = ProfileMenu

  local CloseButton = vgui.Create( "DButton" , ProfileMenu)
  CloseButton:SetSize( ScrH/30, ScrH/30)
  CloseButton:SetPos(ProfileMenu:GetWide()-(ScrH/30)+1, 0)
  CloseButton:SetText("")
  CloseButton.DoClick = function()
    ProfileMenu:Hide()
  end
  local CloseIcon = Material( "vgui/white_x.png" )
  CloseButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(255,0,0))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(CloseIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local BanButton = vgui.Create( "DButton" , ProfileMenu)
  BanButton:SetSize( ScrH/17.25, ScrH/17.25)
  BanButton:SetPos(ScrH/11, ScrH/30)
  BanButton:SetText("")
  BanButton.DoClick = function()

  end
  local BanIcon = Material( "vgui/ban.png" )
  BanButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(255,0,0))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(BanIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local Avatar, Button = fuse.getPlyAvatar(Ply, ProfileMenu)
	Avatar:SetSize(ScrH/12, ScrH/12)
	Avatar:SetPos( 0, 0)
  Button.OnCursorEntered = function()
    Avatar:SetSize(ScrH/5, ScrH/5)
  end
  Button.OnCursorExited = function()
    Avatar:SetSize(ScrH/12, ScrH/12)
  end

end