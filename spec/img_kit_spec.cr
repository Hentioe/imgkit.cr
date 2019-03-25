require "./spec_helper"

describe ImgKit do
  # TODO: Write tests

  it "works" do
    true.should eq(true)
  end

  it "resize" do
    img = ImgKit::Image.new("demo.png")
    img.resize(width: 301)
    img.save("output/resize.png")
    img.finish
  end

  it "blur" do
    img = ImgKit::Image.new("demo.png")
    img.blur(5.0)
    img.save("output/blur.png")
    img.finish
  end

  it "crop" do
    img = ImgKit::Image.new("demo.png")
    img.crop(width: 120, height: 200, x: 50, y: 50)
    img.save("output/crop.png")
    img.finish
  end

  it "combin" do
    img = ImgKit::Image.new("demo.png")
    img.resize(width: 410)
    img.blur(5.0)
    img.crop(width: 200)
    img.save("output/combin.png")
    img.finish
  end
end
