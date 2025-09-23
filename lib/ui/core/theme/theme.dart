import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff405f90),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd6e3ff),
      onPrimaryContainer: Color(0xff274777),
      secondary: Color(0xff3c6939),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbcf0b4),
      onSecondaryContainer: Color(0xff245024),
      tertiary: Color(0xff006b5f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9ef2e3),
      onTertiaryContainer: Color(0xff005048),
      error: Color(0xff904a45),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff73332f),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff44474e),
      outline: Color(0xff74777f),
      outlineVariant: Color(0xffc4c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff274777),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff002204),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff245024),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff00201c),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff005048),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff123665),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4f6ea0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff123f14),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4a7847),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e37),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1e7a6e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e2320),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa15853),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff33363e),
      outline: Color(0xff4f525a),
      outlineVariant: Color(0xff6a6d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff4f6ea0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff365586),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a7847),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff325f30),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1e7a6e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006056),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9ea),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff022b5b),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff29497a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff05340b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff265326),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00332d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00534a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511917),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff763631),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292c33),
      outlineVariant: Color(0xff464951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff29497a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0c3262),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff265326),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0d3b11),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00534a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a33),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e5),
      surfaceContainerHigh: Color(0xffcfd5d6),
      surfaceContainerHighest: Color(0xffc2c7c9),
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
      onPrimary: Color(0xff08305f),
      primaryContainer: Color(0xff274777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xffa1d39a),
      onSecondary: Color(0xff0a390f),
      secondaryContainer: Color(0xff245024),
      onSecondaryContainer: Color(0xffbcf0b4),
      tertiary: Color(0xff82d5c7),
      onTertiary: Color(0xff003731),
      tertiaryContainer: Color(0xff005048),
      onTertiaryContainer: Color(0xff9ef2e3),
      error: Color(0xffffb3ad),
      onError: Color(0xff571e1b),
      errorContainer: Color(0xff73332f),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffc4c6cf),
      outline: Color(0xff8e9099),
      outlineVariant: Color(0xff44474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff405f90),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff274777),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff002204),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff245024),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff00201c),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff005048),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
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
      primaryContainer: Color(0xff7391c6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb6eaae),
      onSecondary: Color(0xff002d06),
      secondaryContainer: Color(0xff6d9c67),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff98ecdd),
      onTertiary: Color(0xff002b26),
      tertiaryContainer: Color(0xff4a9e92),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cd),
      onError: Color(0xff481311),
      errorContainer: Color(0xffcc7b74),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadce5),
      outline: Color(0xffafb2bb),
      outlineVariant: Color(0xff8d9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff284878),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112a),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff123665),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff001602),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff123f14),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff001511),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff003e37),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff3f4647),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2d3435),
      surfaceContainerHighest: Color(0xff393f40),
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
      primaryContainer: Color(0xffa5c3fb),
      onPrimaryContainer: Color(0xff000b20),
      secondary: Color(0xffcafec0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9dcf96),
      onSecondaryContainer: Color(0xff000f01),
      tertiary: Color(0xffaffff0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7ed1c3),
      onTertiaryContainer: Color(0xff000e0b),
      error: Color(0xffffecea),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea7),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeeeff9),
      outlineVariant: Color(0xffc0c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff284878),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00112a),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff001602),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff001511),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff4b5152),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
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
  );


  List<ExtendedColor> get extendedColors => [
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
