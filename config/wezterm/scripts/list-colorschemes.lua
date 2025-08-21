local wezterm = require("wezterm")

for name, _ in pairs(wezterm.color_schemes) do
  print(name)
end
