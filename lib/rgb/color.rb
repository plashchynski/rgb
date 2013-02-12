module RGB
  class Color
    attr_reader :h, :s, :l

    def self.from_rgb_hex(color)
      color = "#%.6x" % color if color.is_a? Integer
      rgb = color[1,7].scan(/.{2}/).map{|component| component.to_i(16)}
      from_rgb(*rgb)
    end

    def self.from_rgb(*rgb)
      rgb.map!{|c| c / 255.0}
      min_rgb = rgb.min
      max_rgb = rgb.max
      delta = max_rgb - min_rgb

      lightness = (max_rgb + min_rgb) / 2.0

      if delta < 1e-5
        hue = 0
        saturation = 0
      else
        saturation = if ( lightness < 0.5 )
          delta / ( max_rgb + min_rgb )
        else
         delta / ( 2 - max_rgb - min_rgb )
        end

        deltas = rgb.map{|c| (((max_rgb - c) / 6.0) + (delta / 2.0)) / delta}

        hue = if (rgb[0] - max_rgb).abs < 1e-5
         deltas[2] - deltas[1]
        elsif (rgb[1] - max_rgb).abs < 1e-5
         ( 1.0 / 3.0 ) + deltas[0] - deltas[2]
        else
         ( 2.0 / 3.0 ) + deltas[1] - deltas[0]
        end
        hue += 1 if hue < 0
        hue -= 1 if hue > 1
      end
      from_fractions(hue, saturation, lightness)
    end

    def self.from_fractions(hue, saturation, lightness)
      new(360 * hue, saturation, lightness)
    end

    def initialize(*hsl)
      self.h, self.s, self.l = hsl
    end

    def to_rgb
      m2 = l <= 0.5 ? l * (s + 1) : l + s - l * s
      m1 = l * 2 - m2
      [hue_to_rgb(m1, m2, hp + 1.0/3), hue_to_rgb(m1, m2, hp), hue_to_rgb(m1, m2, hp - 1.0/3)].map { |c| (c * 0xff).round }
    end

    def to_hsl
      [h,s,l]
    end

    def to_rgb_hex
      "#" + to_rgb.map {|c| "%02X" % c }.join
    end

    def h=(hue)
      @h = hue % 360
    end

    def s=(saturation)
      @s = if saturation < 0
        0.0
      elsif saturation > 1
        1.0
      else
        saturation
      end
    end

    def l=(lightness)
      @l = if lightness < 0
        0.0
      elsif lightness > 1
        1.0
      else
        lightness
      end
    end

    def lighten!(amount)
      @l += amount / 100.0
    end

    def lighten_percent!(percentage)
      @l += (1 - @l) * (percentage / 100.0)
    end

    def darken!(amount)
      @l -= (amount / 100.0)
    end

    def darken_percent!(percentage)
      @l *= 1.0 - (percentage / 100.0)
    end

    def saturate!(amount)
      @s += amount / 100.0
    end

    def saturate_percent!(percentage)
      @s += (1 - @s) * (percentage / 100.0)
    end

    def desaturate!(amount)
      @s -= amount / 100.0
    end

    def desaturate_percent!(percentage)
      @s *= (1.0 - (percentage / 100.0))
    end

    # define non-bang methods
    [:darken, :darken_percent, :lighten, :lighten_percent, :saturate, :saturate_percent, :desaturate,
      :desaturate_percent].each do |method_name|
        define_method method_name do |*args|
          dup.tap { |color| color.send(:"#{method_name}!", *args) }
        end
    end

  private
    #hue as a percentage
    def hp
      h / 360.0
    end

    # helper for making rgb
    def hue_to_rgb(m1, m2, h)
      h += 1 if h < 0
      h -= 1 if h > 1
      return m1 + (m2 - m1) * h * 6 if h * 6 < 1
      return m2 if h * 2 < 1
      return m1 + (m2 - m1) * (2.0/3 - h) * 6 if h * 3 < 2
      return m1
    end
  end
end
