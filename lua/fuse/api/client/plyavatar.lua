
local BotIcon = Material( "bot.png" )

fuse.getPlyAvatar = function(Ply, Parent)

  if Ply:IsBot() then
    local BotAvatar = vgui.Create( "DPanel", Parent)
    BotAvatar.Paint = function( self, w, h)
      if not Ply:IsValid() then return end
      local Inverse = HSVToColor(((ColorToHSV(team.GetColor(Ply:Team()))+180))%360,1,1)
      draw.RoundedBox( 0, 0, 0, w, h, Inverse)
      surface.SetDrawColor(team.GetColor(Ply:Team()))
      surface.SetMaterial(BotIcon)
      surface.DrawTexturedRect( 0, 0, w, h )
      end
    return BotAvatar, BotAvatar
  else

    local Avatar = vgui.Create( "AvatarImage", Parent)
    Avatar:SetPlayer(Ply, 128)

    local PlyAvatarButton = vgui.Create( "DButton", Avatar)
    PlyAvatarButton:Dock(FILL)
    PlyAvatarButton:SetText("")
    PlyAvatarButton:SetAlpha(0)
    PlyAvatarButton.DoClick = function()
        Ply:ShowProfile()
    end
    return Avatar, PlyAvatarButton
  end

end
