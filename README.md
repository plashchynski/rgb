rgb — Easy colors manipulation
------------------------

A simple Ruby library built to handle the easy conversion and manipulation of colors. Inspired by compass-colors https://github.com/chriseppstein/compass-colors and jColour.js https://github.com/lingo/jcolour.

## Examples
```ruby
require 'rgb'

# Supported input data color formas:
color = RGB::Color.from_rgb_hex("#333333")
color = RGB::Color.from_rgb_hex(0xFF0000)
color = RGB::Color.from_rgb(115, 38, 38)
color = RGB::Color.from_fractions(0, 1.0, 0.5) # HSL

# Supported color manipulations:
color.darken(20)
color.darken_percent(10)
color.darken!(20)
color.darken_percent!(10)
color.lighten(20)
color.lighten_percent(20)
color.lighten!(20)
color.lighten_percent!(20)
color.saturate(20)
color.saturate_percent(20)
color.saturate!(20)
color.saturate_percent!(20)
color.desaturate(20)
color.desaturate_percent(20)
color.desaturate!(20)
color.desaturate_percent!(20)

# Also you can adjust color hue, saturation, and lightness values manually:
color.h = 0.1
color.s = 0.2
color.l = 0.3

# Supported output formats:
color.to_rgb_hex
=> "#732626"
color.to_hsl
=> [0, 1.0, 0.5]
color.to_rgb
=> [115, 38, 38]
```

## Support

Feel free to create [issues](https://github.com/plashchynski/rgb/issues)


## License

Please see [LICENSE](https://github.com/plashchynski/rgb/blob/master/LICENSE) for licensing details.
