require 'spec_helper'

describe RGB::Color do
  describe 'Input' do

    describe :initialize do
      it 'handles negative values' do
        color = RGB::Color.new(-360, -1.0, -0.5)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end

      it 'handles values that are too big' do
        color = RGB::Color.new(361, 1.1, 1.1)
        expect(color.to_hsl).to be_eql [1, 1.0, 1.0]
      end
    end

    describe :from_rgb_hex do
      it 'should init color object with css-like hex color string' do
        color = RGB::Color.from_rgb_hex('#333333')
        expect(color.to_hsl).to be_eql [0, 0.0, 0.2]
      end

      it 'should init color object with integer' do
        color = RGB::Color.from_rgb_hex(0xFF0000)
        expect(color.to_hsl).to be_eql [0, 1.0, 0.5]
      end
    end

    describe :from_rgb do
      it 'should init color object with rgb values' do
        color = RGB::Color.from_rgb(0xFF, 0xFF, 0xFF)
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end
    end

    describe :rgb_to_hsl do
      describe :rgb_to_hsl do
        it 'should convert rgb to hls (white)' do
          color = RGB::Color.rgb_to_hsl(255, 255, 255)
          r, g, b = color
          expect(r).to be_within(0.001).of(0.000)
          expect(g).to be_within(0.001).of(0.000)
          expect(b).to be_within(0.001).of(1.000)
        end

        it 'should convert rgb to hls (black)' do
          color = RGB::Color.rgb_to_hsl(0, 0, 0)
          r, g, b = color
          expect(r).to be_within(0.001).of(0.000)
          expect(g).to be_within(0.001).of(0.000)
          expect(b).to be_within(0.001).of(0.000)
        end
      end

      it 'should convert rgb to hls (red)' do
        color = RGB::Color.rgb_to_hsl(255, 0, 0)
        r, g, b = color
        expect(r).to be_within(0.001).of(0.000)
        expect(g).to be_within(0.001).of(1.000)
        expect(b).to be_within(0.001).of(0.500)
      end

      it 'should convert rgb to hls (green)' do
        color = RGB::Color.rgb_to_hsl(0, 255, 0)
        r, g, b = color
        expect(r).to be_within(0.001).of(0.333)
        expect(g).to be_within(0.001).of(1.000)
        expect(b).to be_within(0.001).of(0.500)
      end

      it 'should convert rgb to hls (blue)' do
        color = RGB::Color.rgb_to_hsl(0, 0, 255)
        r, g, b = color
        expect(r).to be_within(0.001).of(0.666)
        expect(g).to be_within(0.001).of(1.000)
        expect(b).to be_within(0.001).of(0.500)
      end
    end

    describe :from_fractions do
      it 'should init color object with HSL fraction values' do
        color = RGB::Color.from_fractions(0, 1.0, 0.5)
        expect(color.to_hsl).to be_eql [0, 1.0, 0.5]
      end
    end
  end

  describe 'Manipulations' do
    describe :darken do
      it 'should darken color by value (returns result as new object)' do
        color = RGB::Color.new(0, 1.0, 0.5)
        expect(color.darken(20).to_hsl).to be_eql [0, 1.0, 0.3]
        expect(color.to_hsl).to be_eql [0, 1.0, 0.5]
      end

      it 'should output a valid rgb color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken(100)
        expect(color.to_rgb).to be_eql [0, 0, 0]
      end

      it 'should output a valid hls color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end

      it 'should output a valid hex color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken(100)
        expect(color.to_rgb_hex).to be_eql '#000000'
      end
    end

    describe :darken! do
      it 'should darken color by value (make change in the object)' do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.darken!(20)
        expect(color.to_hsl).to be_eql [0, 1.0, 0.3]
      end

      it 'should output a valid rgb color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken!(100)
        expect(color.to_rgb).to be_eql [0, 0, 0]
      end

      it 'should output a valid hls color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken!(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end

      it 'should output a valid hex color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken!(100)
        expect(color.to_rgb_hex).to be_eql '#000000'
      end
    end

    describe :darken_percent do
      it 'should darken color by percentage (returns result as new object)' do
        color = RGB::Color.new(0, 0, 0.3)
        expect(color.darken_percent(10).to_hsl).to be_eql [0, 0.0, 0.27]
        expect(color.to_hsl).to be_eql [0, 0.0, 0.3]
      end

      it 'should output a valid rgb color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken_percent(100)
        expect(color.to_rgb).to be_eql [0, 0, 0]
      end

      it 'should output a valid hls color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken_percent(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end

      it 'should output a valid hex color when darkening black' do
        color = RGB::Color.new(0, 0, 0).darken_percent(100)
        expect(color.to_rgb_hex).to be_eql '#000000'
      end
    end

    describe :darken_percent! do
      it 'should darken color by percentage (make change in the object)' do
        color = RGB::Color.new(0, 0, 0.3)
        color.darken_percent!(10)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.27]
      end

      it 'should output a valid rgb color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken_percent!(100)
        expect(color.to_rgb).to be_eql [0, 0, 0]
      end

      it 'should output a valid hls color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken_percent!(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end

      it 'should output a valid hex color when darkening black' do
        color = RGB::Color.new(0, 0, 0)
        color.darken_percent!(100)
        expect(color.to_rgb_hex).to be_eql '#000000'
      end
    end

    describe :lighten do
      it 'should lighten color by value (returns result as new object)' do
        color = RGB::Color.new(360, 1.0, 0.5)
        expect(color.lighten(20).to_hsl).to be_eql [0, 1.0, 0.7]
        expect(color.to_hsl).to be_eql [0, 1.0, 0.5]
      end

      it 'should output a valid rgb color when ligthening white' do
        color = RGB::Color.new(255, 255, 255).lighten(100)
        expect(color.to_rgb).to be_eql [255, 255, 255]
      end

      it 'should output a valid hls color when ligthening white' do
        color = RGB::Color.new(0, 0, 1.0).lighten(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end

      it 'should output a valid hex color when ligthening white' do
        color = RGB::Color.new(255, 255, 255).lighten(100)
        expect(color.to_rgb_hex).to be_eql '#FFFFFF'
      end
    end

    describe :lighten! do
      it 'should lighten color by value (make change in the object)' do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.lighten!(20)
        expect(color.to_hsl).to be_eql [0, 1.0, 0.7]
      end

      it 'should output a valid rgb color when ligthening white' do
        color = RGB::Color.new(255, 255, 255)
        color.lighten!(100)
        expect(color.to_rgb).to be_eql [255, 255, 255]
      end

      it 'should output a valid hls color when ligthening white' do
        color = RGB::Color.new(0, 0.0, 1.0)
        color.lighten!(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end

      it 'should output a valid hex color when ligthening white' do
        color = RGB::Color.new(255, 255, 255)
        color.lighten!(100)
        expect(color.to_rgb_hex).to be_eql '#FFFFFF'
      end
    end

    describe :lighten_percent do
      it 'should lighten color by percentage (returns result as new object)' do
        color = RGB::Color.new(0, 0, 0.3)
        expect(color.lighten_percent(10).to_hsl).to be_eql [0, 0.0, 0.37]
        expect(color.to_hsl).to be_eql [0, 0.0, 0.3]
      end

      it 'should output a valid rgb color when ligthening white' do
        color = RGB::Color.new(255, 255, 255).lighten_percent(100)
        expect(color.to_rgb).to be_eql [255, 255, 255]
      end

      it 'should output a valid hls color when ligthening white' do
        color = RGB::Color.new(0, 0.0, 1.0).lighten_percent(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end

      it 'should output a valid hex color when ligthening white' do
        color = RGB::Color.new(255, 255, 255).lighten_percent(100)
        expect(color.to_rgb_hex).to be_eql '#FFFFFF'
      end
    end

    describe :lighten_percent! do
      it 'should lighten color by percentage (make change in the object)' do
        color = RGB::Color.new(0, 0, 0.3)
        color.lighten_percent!(10)
        expect(color.to_hsl).to be_eql [0, 0.0, 0.37]
      end

      it 'should output a valid rgb color when ligthening white' do
        color = RGB::Color.new(255, 255, 255)
        color.lighten_percent!(100)
        expect(color.to_rgb).to be_eql [255, 255, 255]
      end

      it 'should output a valid hls color when ligthening white' do
        color = RGB::Color.new(0, 0.0, 1.0)
        color.lighten_percent!(100)
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end

      it 'should output a valid hex color when ligthening white' do
        color = RGB::Color.new(255, 255, 255)
        color.lighten_percent!(100)
        expect(color.to_rgb_hex).to be_eql '#FFFFFF'
      end
    end

    describe :saturate do
      it 'should saturate color by value (returns result as new object)' do
        color = RGB::Color.new(0, 0.5, 0.5)
        expect(color.saturate(20).to_hsl).to be_eql [0, 0.7, 0.5]
        expect(color.to_hsl).to be_eql [0, 0.5, 0.5]
      end
    end

    describe :saturate! do
      it 'should saturate color by value (make change in the object)' do
        color = RGB::Color.new(0, 0.5, 0.5)
        color.saturate!(20)
        expect(color.to_hsl).to be_eql [0, 0.7, 0.5]
      end
    end

    describe :saturate_percent do
      it 'should saturate color by percentage (returns result as new object)' do
        color = RGB::Color.new(0, 0, 0.3)
        expect(color.saturate_percent(10).to_hsl).to be_eql [0, 0.1, 0.3]
        expect(color.to_hsl).to be_eql [0, 0.0, 0.3]
      end
    end

    describe :saturate_percent! do
      it 'should saturate color by percentage (make change in the object)' do
        color = RGB::Color.new(0, 0, 0.3)
        color.saturate_percent!(10)
        expect(color.to_hsl).to be_eql [0, 0.1, 0.3]
      end
    end

    describe :desaturate do
      it 'should desaturate color by value (returns result as new object)' do
        color = RGB::Color.new(0, 1.0, 0.5)
        expect(color.desaturate(20).to_hsl).to be_eql [0, 0.8, 0.5]
        expect(color.to_hsl).to be_eql [0, 1.0, 0.5]
      end
    end

    describe :desaturate! do
      it 'should desaturate color by value (make change in the object)' do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.desaturate!(20)
        expect(color.to_hsl).to be_eql [0, 0.8, 0.5]
      end
    end

    describe :desaturate_percent do
      it 'should desaturate color by percentage (returns result as new object)' do
        color = RGB::Color.new(0, 0.5, 0.3)
        expect(color.desaturate_percent(10).to_hsl).to be_eql [0, 0.45, 0.3]
        expect(color.to_hsl).to be_eql [0, 0.5, 0.3]
      end
    end

    describe :desaturate_percent! do
      it 'should desaturate color by percentage (make change in the object)' do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.desaturate_percent!(10)
        expect(color.to_hsl).to be_eql [0, 0.45, 0.3]
      end
    end

    describe :invert do
      it 'should invert color (returns result as new object)' do
        color = RGB::Color.new(0, 0, 1.0)
        expect(color.invert.to_hsl).to be_eql [0, 0.0, 0.0]
        expect(color.to_hsl).to be_eql [0, 0.0, 1.0]
      end
    end

    describe :invert! do
      it 'should invert color (make change in the object)' do
        color = RGB::Color.new(0, 0, 1.0)
        color.invert!
        expect(color.to_hsl).to be_eql [0, 0.0, 0.0]
      end
    end

    describe :mix do
      it 'should mix two colors' do
        color1 = RGB::Color.from_rgb_hex('#1F77B4')
        color2 = RGB::Color.from_rgb_hex('#D62728')
        mix_50pct = color1.mix(color2)
        mix_10pct = color1.mix(color2, 10)
        expect(mix_50pct.to_rgb_hex).to be_eql '#7B4F6E'
        expect(mix_10pct.to_rgb_hex).to be_eql '#316FA6'
      end
    end

    describe :mix! do
      it 'should mix other color in-place' do
        color1 = RGB::Color.from_rgb_hex('#1F77B4')
        color2 = RGB::Color.from_rgb_hex('#D62728')
        color1.mix!(color2, 10)
        expect(color1.to_rgb_hex).to be_eql '#316FA6'
      end
    end
  end

  describe 'Output' do
    describe :to_rgb do
      it 'should return rgb color values' do
        color = RGB::Color.new(0, 0.5, 0.3)
        expect(color.to_rgb).to be_eql [115, 38, 38]
      end
    end

    describe :to_hsl do
      it 'should return hsl color values' do
        color = RGB::Color.new(0, 0.5, 0.3)
        expect(color.to_hsl).to be_eql [0, 0.5, 0.3]
      end
    end

    describe :to_rgb_hex do
      it 'should return rgb hex color representation' do
        color = RGB::Color.new(0, 0.5, 0.3)
        expect(color.to_rgb_hex).to be_eql '#732626'
      end
    end
  end
end
