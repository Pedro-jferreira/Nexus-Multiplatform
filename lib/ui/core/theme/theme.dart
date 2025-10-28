import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff405f90),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1565c0),
      onPrimaryContainer: Color(0xffdae5ff),
      secondary: Color(0xff00685d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff008376),
      onSecondaryContainer: Color(0xfff4fffb),
      tertiary: Color(0xff6d5e00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffede00),
      onTertiaryContainer: Color(0xff716200),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff191c21),
      onSurfaceVariant: Color(0xff424752),
      outline: Color(0xff727783),
      outlineVariant: Color(0xffc2c6d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00468c),
      secondaryFixed: Color(0xff8df5e4),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff70d8c8),
      onSecondaryFixedVariant: Color(0xff005048),
      tertiaryFixed: Color(0xffffe244),
      onTertiaryFixed: Color(0xff211b00),
      tertiaryFixedDim: Color(0xffe3c600),
      onTertiaryFixedVariant: Color(0xff524700),
      surfaceDim: Color(0xffd8dae2),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fb),
      surfaceContainer: Color(0xffecedf6),
      surfaceContainerHigh: Color(0xffe7e8f0),
      surfaceContainerHighest: Color(0xffe1e2ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00356e),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1565c0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003e37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff007b6e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3f3600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7d6d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff0e1117),
      onSurfaceVariant: Color(0xff313641),
      outline: Color(0xff4d525e),
      outlineVariant: Color(0xff686d79),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff236cc8),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0054a5),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff007b6e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006056),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7d6d00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff625500),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6ce),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fb),
      surfaceContainer: Color(0xffe7e8f0),
      surfaceContainerHigh: Color(0xffdbdce5),
      surfaceContainerHighest: Color(0xffd0d1d9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002b5b),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004890),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00332d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00534a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff342c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff554900),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272c37),
      outlineVariant: Color(0xff444955),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff004890),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003267),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00534a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a33),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff554900),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3b3200),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b8c0),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff0f9),
      surfaceContainer: Color(0xffe1e2ea),
      surfaceContainerHigh: Color(0xffd3d4dc),
      surfaceContainerHighest: Color(0xffc5c6ce),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa9c7ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff003063),
      primaryContainer: Color(0xff1565c0),
      onPrimaryContainer: Color(0xffdae5ff),
      secondary: Color(0xff70d8c8),
      onSecondary: Color(0xff003731),
      secondaryContainer: Color(0xff32a192),
      onSecondaryContainer: Color(0xff000f0c),
      tertiary: Color(0xfffffaf6),
      onTertiary: Color(0xff393000),
      tertiaryContainer: Color(0xfffede00),
      onTertiaryContainer: Color(0xff716200),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111319),
      onSurface: Color(0xffe1e2ea),
      onSurfaceVariant: Color(0xffc2c6d4),
      outline: Color(0xff8c919d),
      outlineVariant: Color(0xff424752),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ea),
      inversePrimary: Color(0xff005db7),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00468c),
      secondaryFixed: Color(0xff8df5e4),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff70d8c8),
      onSecondaryFixedVariant: Color(0xff005048),
      tertiaryFixed: Color(0xffffe244),
      onTertiaryFixed: Color(0xff211b00),
      tertiaryFixedDim: Color(0xffe3c600),
      onTertiaryFixedVariant: Color(0xff524700),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff37393f),
      surfaceContainerLowest: Color(0xff0b0e14),
      surfaceContainerLow: Color(0xff191c21),
      surfaceContainer: Color(0xff1d2025),
      surfaceContainerHigh: Color(0xff272a30),
      surfaceContainerHighest: Color(0xff32353b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffccddff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff002550),
      primaryContainer: Color(0xff5191ee),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff87eedd),
      onSecondary: Color(0xff002b26),
      secondaryContainer: Color(0xff32a192),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf6),
      onTertiary: Color(0xff393000),
      tertiaryContainer: Color(0xfffede00),
      onTertiaryContainer: Color(0xff514500),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd8dcea),
      outline: Color(0xffadb2bf),
      outlineVariant: Color(0xff8b909d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ea),
      inversePrimary: Color(0xff00478e),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112a),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00356e),
      secondaryFixed: Color(0xff8df5e4),
      onSecondaryFixed: Color(0xff001511),
      secondaryFixedDim: Color(0xff70d8c8),
      onSecondaryFixedVariant: Color(0xff003e37),
      tertiaryFixed: Color(0xffffe244),
      onTertiaryFixed: Color(0xff151100),
      tertiaryFixedDim: Color(0xffe3c600),
      onTertiaryFixedVariant: Color(0xff3f3600),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff42444b),
      surfaceContainerLowest: Color(0xff05070c),
      surfaceContainerLow: Color(0xff1b1e23),
      surfaceContainer: Color(0xff25282e),
      surfaceContainerHigh: Color(0xff303339),
      surfaceContainerHighest: Color(0xff3b3e44),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebf0ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa3c3ff),
      onPrimaryContainer: Color(0xff000b20),
      secondary: Color(0xffaffff0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff6cd4c4),
      onSecondaryContainer: Color(0xff000f0c),
      tertiary: Color(0xfffffaf6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffede00),
      onTertiaryContainer: Color(0xff2e2700),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffebf0fe),
      outlineVariant: Color(0xffbec2d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ea),
      inversePrimary: Color(0xff00478e),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00112a),
      secondaryFixed: Color(0xff8df5e4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff70d8c8),
      onSecondaryFixedVariant: Color(0xff001511),
      tertiaryFixed: Color(0xffffe244),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe3c600),
      onTertiaryFixedVariant: Color(0xff151100),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff4d5057),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2025),
      surfaceContainer: Color(0xff2e3037),
      surfaceContainerHigh: Color(0xff393b42),
      surfaceContainerHighest: Color(0xff44474d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
    extensions: <ThemeExtension<dynamic>>[
      ExtendedColorsTheme(success: sucess),
    ],
  );

  /// Sucess
  static const sucess = ExtendedColor(
    seed: Color(0xff4c8429),
    value: Color(0xff4c8429),
    light: ColorFamily(
      color: Color(0xff346a10),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff346a10),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff346a10),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
    dark: ColorFamily(
      color: Color(0xff99d771),
      onColor: Color(0xff153800),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff99d771),
      onColor: Color(0xff153800),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff99d771),
      onColor: Color(0xff153800),
      colorContainer: Color(0xff4c8429),
      onColorContainer: Color(0xffffffff),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    sucess,
  ];
}


class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

class ExtendedColors {
  final ExtendedColor success;

  const ExtendedColors({
    required this.success,
  });
}
class ExtendedColorsTheme extends ThemeExtension<ExtendedColorsTheme> {
  final ExtendedColor success;

  const ExtendedColorsTheme({required this.success});

  @override
  ExtendedColorsTheme copyWith({ExtendedColor? success}) {
    return ExtendedColorsTheme(success: success ?? this.success);
  }

  @override
  ExtendedColorsTheme lerp(ThemeExtension<ExtendedColorsTheme>? other, double t) {
    if (other is! ExtendedColorsTheme) return this;
    return ExtendedColorsTheme(success: other.success);
  }

  /// 🔥 Getter que escolhe automaticamente a cor conforme o modo atual
  ColorFamily getFamily(Brightness brightness) {
    return brightness == Brightness.dark ? success.dark : success.light;
  }
}

