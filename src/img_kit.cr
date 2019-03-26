require "./img_kit/**"

module ImgKit
  VERSION = "0.1.0-dev"

  extend self

  def terminus
    LibMagickWand.MagickWandTerminus
  end

  class Image
    property path : String

    @wand = uninitialized LibMagickWand::MagickWand*
    getter

    getter destroy = false
    getter width, height

    def initialize(@path)
      LibMagickWand.MagickWandGenesis
      @wand = LibMagickWand.NewMagickWand
      LibMagickWand.MagickReadImage(@wand, @path)
      @width = LibMagickWand.MagickGetImageWidth(@wand)
      @height = LibMagickWand.MagickGetImageHeight(@wand)
    end

    def resize(width = 0, height = 0, filter = LibMagickWand::FilterTypes::Lanczos2Filter)
      # width : height
      ratio = @width.fdiv @height
      if width == 0
        width = (height * ratio).to_i
      elsif height == 0
        height = (width / ratio).to_i
      end
      LibMagickWand.MagickResizeImage(@wand, width, height, filter)
    end

    def blur(sigma, radius = 0.0)
      LibMagickWand.MagickGaussianBlurImage(@wand, radius, sigma)
    end

    def crop(width = 0, height = 0, x = 0, y = 0)
      LibMagickWand.MagickCropImage(@wand, width, height, x, y)
    end

    def save(path)
      LibMagickWand.MagickWriteImages(@wand, path, LibMagickWand::MagickBooleanType::MagickTrue)
    end

    def finish
      LibMagickWand.DestroyMagickWand(@wand)
      destroy = true
    end

    def destroy?
      destroy
    end
  end
end
