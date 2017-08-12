
fuse.print = function(Msg)

  print("[FUSE] " .. Msg)

end

fuse.ColourMultiply = function(Colour, Multiplier)

  if isbool(Multiplier) then
    if Multiplier then
      return Color(Colour["r"]*1, Colour["g"]*1, Colour["b"]*1)
    end
    return Color(Colour["r"]*0, Colour["g"]*0, Colour["b"]*0)
  end

  return Color(Colour["r"]*Multiplier, Colour["g"]*Multiplier, Colour["b"]*Multiplier)

end
