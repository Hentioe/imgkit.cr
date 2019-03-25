module ImgKit
  @[Link("MagickWand")]
  lib LibMagickWand
    fun MagickWandGenesis
    fun NewMagickWand : MagickWand*
    fun MagickReadImage(MagickWand*, LibC::Char*) : MagickBooleanType
    fun MagickWriteImages(MagickWand*, LibC::Char*, MagickBooleanType) : MagickBooleanType
    fun DestroyMagickWand(MagickWand*) : MagickWand*
    fun MagickWandTerminus
    fun MagickGetImageWidth(MagickWand*) : LibC::SizeT
    fun MagickGetImageHeight(MagickWand*) : LibC::SizeT
  end
end
