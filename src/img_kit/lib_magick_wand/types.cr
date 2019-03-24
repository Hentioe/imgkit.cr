module ImgKit
  lib LibMagickWand
    MagickPathExtent = 4096

    struct MagickWand
      id : LibC::SizeT
      name : LibC::Char[MagickPathExtent]
      signature : LibC::SizeT
    end

    enum MagickBooleanType
      MagickFalse
      MagickTrue
    end

    enum FilterTypes
      UndefinedFilter
      PointFilter
      BoxFilter
      TriangleFilter
      HermiteFilter
      HanningFilter
      HammingFilter
      BlackmanFilter
      GaussianFilter
      QuadraticFilter
      CubicFilter
      CatromFilter
      MitchellFilter
      JincFilter
      SincFilter
      SincFastFilter
      KaiserFilter
      WelshFilter
      ParzenFilter
      BohmanFilter
      BartlettFilter
      LagrangeFilter
      LanczosFilter
      LanczosSharpFilter
      Lanczos2Filter
      Lanczos2SharpFilter
      RobidouxFilter
      RobidouxSharpFilter
      CosineFilter
      SplineFilter
      LanczosRadiusFilter
      SentinelFilter
    end

    enum PixelInterpolateMethod
      UndefinedInterpolatePixel
      AverageInterpolatePixel
      Average9InterpolatePixel
      Average16InterpolatePixel
      BackgroundInterpolatePixel
      BilinearInterpolatePixel
      BlendInterpolatePixel
      CatromInterpolatePixel
      IntegerInterpolatePixel
      MeshInterpolatePixel
      NearestInterpolatePixel
      SplineInterpolatePixel
    end
  end
end
