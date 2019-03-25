require "./spec_helper"

describe ImgKit do
  # TODO: Write tests

  it "works" do
    true.should eq(true)
  end

  it "resize" do
    img = ImgKit::Image.new("demo.png")
    img.resize(301)
    img.save("output/resize.png")
    img.finish
  end

  it "blur" do
    img = ImgKit::Image.new("demo.png")
    img.blur(5.0)
    img.save("output/blur.png")
    img.finish
  end

  it "combin" do
    img = ImgKit::Image.new("demo.png")
    img.resize(width: 410)
    img.blur(5.0)
    img.save("output/resize_blur.png")
    img.finish
  end
end
