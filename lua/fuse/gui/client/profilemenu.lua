local ScrW = ScrW()
local ScrH = ScrH()

fuseui.ProfileMenus = {}

fuseui.OpenProfileMenu = function(Ply)

	local Nick = Ply:Nick()
	local ID = Ply:SteamID()
	local TeamColour = team.GetColor(Ply:Team())

	local ProfileMenu = vgui.Create("DFrame")
	ProfileMenu:SetSize(ScrW/3.5, ScrH/3.3)
  ProfileMenu:ShowCloseButton(false)
  ProfileMenu:MakePopup()
  ProfileMenu:SetKeyboardInputEnabled(false)
  ProfileMenu:DockPadding( 0, ScrH/11, 0, 0)
  ProfileMenu.Paint = function( self, w, h)
    --Need to code this to show disconnect theme when player no longer valid
    draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,200))
    draw.RoundedBox( 0, 0, 0, ScrH/11, ScrH/11, TeamColour)
    draw.RoundedBox( 0, 0, 0, w, ScrH/30, TeamColour)
    surface.SetFont( "Trebuchet24" )
	  surface.SetTextColor( 0, 0, 0)
	  surface.SetTextPos(ScrH/10, ScrH/180)
	  surface.DrawText(Nick)
  end
  fuseui.ProfileMenus[Ply] = ProfileMenu

  local CloseButton = vgui.Create( "DButton" , ProfileMenu)
  CloseButton:SetSize( ScrH/30, ScrH/30)
  CloseButton:SetPos(ProfileMenu:GetWide()-(ScrH/30)+1, 0)
  CloseButton:SetText("")
  CloseButton.DoClick = function()
    ProfileMenu:Remove()
    fuseui.ProfileMenus[Ply] = nil
  end
  local CloseIcon = Material( "fuseui/white_x.png" )
  CloseButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, fuse.ColourMultiply(Color(100,100,100),CloseButton:IsHovered()))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(CloseIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local BanButton = vgui.Create( "DButton" , ProfileMenu)
  BanButton:SetSize( ScrH/17.25, ScrH/17.25)
  BanButton:SetPos(ScrH/11, ScrH/30)
  BanButton:SetText("")
  BanButton.DoClick = function()
    RunConsoleCommand("ulx", "banid", ID, 0, "Fuse Port Ban")
  end
  local BanIcon = Material( "ban.png" )
  BanButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(255,0,0))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(BanIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local KickButton = vgui.Create( "DButton" , ProfileMenu)
  KickButton:SetSize(ScrH/17.25, ScrH/17.25)
  KickButton:SetPos((ScrH/11)+(ScrH/17.25), ScrH/30)
  KickButton:SetText("")
  KickButton.DoClick = function()
    RunConsoleCommand("ulx", "kick", Nick)
  end
  local KickIcon = Material( "kick.png" )
  KickButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(160,82,45))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(KickIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local FreezeButton = vgui.Create( "DButton" , ProfileMenu)
  FreezeButton:SetSize(ScrH/17.25, ScrH/17.25)
  FreezeButton:SetPos((ScrH/11)+(ScrH/17.25*2-1), ScrH/30)
  FreezeButton:SetText("")
  FreezeButton.DoClick = function()
    RunConsoleCommand("ulx", "freeze", Nick)
  end
  local FreezeIcon = Material( "freeze.png" )
  FreezeButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(135,206,250))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(FreezeIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

  local JailButton = vgui.Create( "DButton" , ProfileMenu)
  JailButton:SetSize(ScrH/17.25, ScrH/17.25)
  JailButton:SetPos((ScrH/11)+(ScrH/17.25*3-1), ScrH/30)
  JailButton:SetText("")
  JailButton.DoClick = function()
      RunConsoleCommand("ulx", "jail", Nick)
  end
  local JailIcon = Material( "jail.png" )
  JailButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(200,200,200))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(JailIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

	local GotoButton = vgui.Create( "DButton" , ProfileMenu)
  GotoButton:SetSize(ScrH/17.25, ScrH/17.25)
  GotoButton:SetPos((ScrH/11)+(ScrH/17.25*4-2), ScrH/30)
  GotoButton:SetText("")
  GotoButton.DoClick = function()
      RunConsoleCommand("ulx", "goto", Nick)
  end
  local GotoIcon = Material( "goto.png" )
  GotoButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(62,189,236))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(GotoIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

	local BringButton = vgui.Create( "DButton" , ProfileMenu)
  BringButton:SetSize(ScrH/17.25, ScrH/17.25)
  BringButton:SetPos((ScrH/11)+(ScrH/17.25*5-2), ScrH/30)
  BringButton:SetText("")
  BringButton.DoClick = function()
      RunConsoleCommand("ulx", "bring", Nick)
  end
  local BringIcon = Material( "bring.png" )
  BringButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(233,131,31))
    surface.SetDrawColor(Color(255,255,255,255))
	  surface.SetMaterial(BringIcon)
    surface.DrawTexturedRect( 0, 0, w, h )
  end

	hook.Run("fuseui_createtabs", ProfileMenu, Ply) --Calls the code to add tabs

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
