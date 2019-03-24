require "./img_kit/**"

module ImgKit
  VERSION = "0.1.0-dev"

  class Image
    property path : String

    @wand = uninitialized LibMagickWand::MagickWand*
    getter

    getter destroy = false

    def initialize(@path)
      LibMagickWand.MagickWandGenesis
      @wand = LibMagickWand.NewMagickWand
      LibMagickWand.MagickReadImage(@wand, @path)
    end

    def resize(width, height)
      LibMagickWand.MagickResizeImage(@wand, width, height, LibMagickWand::FilterTypes::Lanczos2Filter)
    end

    def blur(sigma)
      LibMagickWand.MagickGaussianBlurImage(@wand, 0, sigma)
    end

    def save(path)
      LibMagickWand.MagickWriteImages(@wand, path, LibMagickWand::MagickBooleanType::MagickTrue)
    end

    def finish
      LibMagickWand.DestroyMagickWand(@wand)
      LibMagickWand.MagickWandTerminus
      destroy = true
    end

    def destroy?
      destroy
    end
  end
end
