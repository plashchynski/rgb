require "spec_helper"
require "rgb"

describe RGB::Color do
  describe "Input" do
    describe :from_rgb_hex do
      it "should init color object with css-like hex color string" do
        color = RGB::Color.from_rgb_hex("#333333")
        color.to_hsl.should == [0, 0, 0.2]
      end

      it "should init color object with integer" do
        color = RGB::Color.from_rgb_hex(0xFF0000)
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end

    describe :from_rgb do
      it "should init color object with rgb values" do
        color = RGB::Color.from_rgb(0xFF, 0xFF, 0xFF)
        color.to_hsl.should == [0, 0, 1.0]
      end
    end

    describe :from_fractions do
      it "should init color object with HSL fraction values" do
        color = RGB::Color.from_fractions(0, 1.0, 0.5)
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end
  end

  describe "Manipulations" do
    describe :darken do
      it "should darken color by value (returns result as new object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.darken(20).to_hsl.should == [0, 1.0, 0.3]
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end

    describe :darken! do
      it "should darken color by value (make change in the object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.darken!(20)
        color.to_hsl.should == [0, 1.0, 0.3]
      end
    end

    describe :darken_percent do
      it "should darken color by percentage (returns result as new object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.darken_percent(10).to_hsl.should == [0, 0, 0.27]
        color.to_hsl.should == [0, 0, 0.3]
      end
    end

    describe :darken_percent! do
      it "should darken color by percentage (make change in the object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.darken_percent!(10)
        color.to_hsl.should == [0, 0, 0.27]
      end
    end

    describe :lighten do
      it "should lighten color by value (returns result as new object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.lighten(20).to_hsl.should == [0, 1.0, 0.7]
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end

    describe :lighten! do
      it "should lighten color by value (make change in the object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.lighten!(20)
        color.to_hsl.should == [0, 1.0, 0.7]
      end
    end

    describe :lighten_percent do
      it "should lighten color by percentage (returns result as new object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.lighten_percent(10).to_hsl.should == [0, 0, 0.37]
        color.to_hsl.should == [0, 0, 0.3]
      end
    end

    describe :lighten_percent! do
      it "should lighten color by percentage (make change in the object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.lighten_percent!(10)
        color.to_hsl.should == [0, 0, 0.37]
      end
    end

    describe :saturate do
      it "should saturate color by value (returns result as new object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.saturate(20).to_hsl.should == [0, 1.2, 0.5]
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end

    describe :saturate! do
      it "should saturate color by value (make change in the object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.saturate!(20)
        color.to_hsl.should == [0, 1.2, 0.5]
      end
    end

    describe :saturate_percent do
      it "should saturate color by percentage (returns result as new object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.saturate_percent(10).to_hsl.should == [0, 0.1, 0.3]
        color.to_hsl.should == [0, 0, 0.3]
      end
    end

    describe :saturate_percent! do
      it "should saturate color by percentage (make change in the object)" do
        color = RGB::Color.new(0, 0, 0.3)
        color.saturate_percent!(10)
        color.to_hsl.should == [0, 0.1, 0.3]
      end
    end

    describe :desaturate do
      it "should desaturate color by value (returns result as new object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.desaturate(20).to_hsl.should == [0, 0.8, 0.5]
        color.to_hsl.should == [0, 1.0, 0.5]
      end
    end

    describe :desaturate! do
      it "should desaturate color by value (make change in the object)" do
        color = RGB::Color.new(0, 1.0, 0.5)
        color.desaturate!(20)
        color.to_hsl.should == [0, 0.8, 0.5]
      end
    end

    describe :desaturate_percent do
      it "should desaturate color by percentage (returns result as new object)" do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.desaturate_percent(10).to_hsl.should == [0, 0.45, 0.3]
        color.to_hsl.should == [0, 0.5, 0.3]
      end
    end

    describe :desaturate_percent! do
      it "should desaturate color by percentage (make change in the object)" do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.desaturate_percent!(10)
        color.to_hsl.should == [0, 0.45, 0.3]
      end
    end
  end

  describe "Output" do
    describe :to_rgb do
      it "should return rgb color values" do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.to_rgb.should == [115, 38, 38]
      end
    end

    describe :to_hsl do
      it "should return hsl color values" do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.to_hsl.should == [0, 0.5, 0.3]
      end
    end

    describe :to_rgb_hex do
      it "should return rgb hex color representation" do
        color = RGB::Color.new(0, 0.5, 0.3)
        color.to_rgb_hex.should == "#732626"
      end
    end
  end
end
