require "./img_kit/**"

module ImgKit
  VERSION = "0.1.0-dev"

  extend self

  def terminus
    LibMagickWand.MagickWandTerminus
  end

  MAGICK_TRUE = LibMagickWand::MagickBooleanType::MagickTrue

  class Image
    property path : String

    @wand = uninitialized LibMagickWand::MagickWand*
    getter

    getter destroy = false
    getter width, height

    def initialize(@path)
      LibMagickWand.MagickWandGenesis
      @wand = LibMagickWand.NewMagickWand

      status = LibMagickWand.MagickReadImage(@wand, @path)

      if status != MAGICK_TRUE
        raise ImgException.new("Error reading #{@path}")
      end

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

      status = LibMagickWand.MagickResizeImage(@wand, width, height, filter)

      if status != MAGICK_TRUE
        raise ResizeException.new("Error resize image to #{width}x#{height}")
      end
    end

    def blur(sigma, radius = 0.0)
      status = LibMagickWand.MagickGaussianBlurImage(@wand, radius, sigma)

      if status != MAGICK_TRUE
        raise BlurException.new("Error blur image to #{radius},#{sigma}")
      end
    end

    def crop(width = 0, height = 0, x = 0, y = 0)
      status = LibMagickWand.MagickCropImage(@wand, width, height, x, y)

      if status != MAGICK_TRUE
        raise CropException.new("Error crop image to #{width},#{height},#{x},#{y}")
      end
    end

    def save(path)
      status = LibMagickWand.MagickWriteImages(@wand, path, LibMagickWand::MagickBooleanType::MagickTrue)

      if status != MAGICK_TRUE
        raise ImgException.new("Error write image to #{path}")
      end
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
