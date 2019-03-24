module ImgKit
  lib LibMagickWand
    fun MagickAdaptiveResizeImage(MagickWand*, LibC::SizeT, LibC::SizeT) : MagickBooleanType
    fun MagickInterpolativeResizeImage(MagickWand*, LibC::SizeT, LibC::SizeT, PixelInterpolateMethod) : MagickBooleanType
    fun MagickResetIterator(MagickWand*)
    fun MagickNextImage(MagickWand*) : MagickBooleanType
    fun MagickResizeImage(MagickWand*, LibC::SizeT, LibC::SizeT, FilterTypes) : MagickBooleanType
  end
end
