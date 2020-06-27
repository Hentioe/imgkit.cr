# ImgKit

Image Toolkit for Crystal (based on MagicWand binding)

## Requirements

- `libmagickwand-dev`
  - Ubuntu: `apt install libmagickwand-dev`
  - Mac: `brew install imagemagick`

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     img_kit:
       github: Hentioe/imgkit.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "img_kit"

# Resize
img = ImgKit::Image.new("demo.png")
img.resize(width: 301)
img.save("output/resize.png")
img.finish

# Blur
img = ImgKit::Image.new("demo.png")
img.blur(5.0)
img.save("output/blur.png")
img.finish

# Crop
img = ImgKit::Image.new("demo.png")
img.crop(width: 120, height: 200, x: 50, y: 50)
img.save("output/crop.png")
img.finish

# Combin
img = ImgKit::Image.new("demo.png")
img.resize(width: 410)
img.blur(5.0)
img.crop(width: 200)
img.save("output/combin.png")
img.finish
```

## Contributing

1. Fork it (<https://github.com/Hentioe/imgkit.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hentioe](https://github.com/Hentioe) - creator and maintainer
