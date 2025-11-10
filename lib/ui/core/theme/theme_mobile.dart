 import 'dart:ui';

import 'package:flutter/material.dart';

 extension ThemeExtras on BuildContext {
   AppColors get colors => Theme.of(this).extension<AppColors>()!;
   TextTheme get textStyles => Theme.of(this).textTheme;
 }
 @immutable
 class AppColors extends ThemeExtension<AppColors> {
   final Color primaryMain;
   final Color primaryEmphasis;
   final Color primarySubtle;

   final Color secondaryMain;
   final Color secondaryEmphasis;
   final Color secondarySubtle;

   final Color background;
   final Color surface;

   final Color text;
   final Color textPlaceholder;

   final Color success;
   final Color error;

   const AppColors({
     required this.primaryMain,
     required this.primaryEmphasis,
     required this.primarySubtle,
     required this.secondaryMain,
     required this.secondaryEmphasis,
     required this.secondarySubtle,
     required this.background,
     required this.surface,
     required this.text,
     required this.textPlaceholder,
     required this.success,
     required this.error,
   });

   /// Tema claro
   static const light = AppColors(
     primaryMain: Color.fromRGBO(21, 101, 192, 1),
     primaryEmphasis: Color.fromRGBO(121, 172, 255, 1),
     primarySubtle: Color.fromRGBO(214, 227, 255, 1),
     secondaryMain: Color.fromRGBO(0, 137, 123, 1),
     secondaryEmphasis: Color.fromRGBO(82, 188, 172, 1),
     secondarySubtle: Color.fromRGBO(198, 248, 234, 1),
     background: Color.fromRGBO(229, 229, 229, 1),
     surface: Color.fromRGBO(255, 255, 255, 1),
     text: Color.fromRGBO(33, 33, 33, 1),
     textPlaceholder: Color.fromRGBO(173, 170, 170, 1),
     success: Color.fromRGBO(46, 125, 50, 1),
     error: Color.fromRGBO(193, 18, 31, 1),
   );

   /// Tema escuro
   static const dark = AppColors(
     primaryMain: Color.fromRGBO(121, 172, 255, 1),
     primaryEmphasis: Color.fromRGBO(21, 101, 192, 1),
     primarySubtle: Color.fromRGBO(13, 71, 161, 1),
     secondaryMain: Color.fromRGBO(82, 188, 172, 1),
     secondaryEmphasis: Color.fromRGBO(0, 137, 123, 1),
     secondarySubtle: Color.fromRGBO(0, 105, 92, 1),
     background: Color.fromRGBO(18, 18, 18, 1),
     surface: Color.fromRGBO(33, 33, 33, 1),
     text: Color.fromRGBO(255, 255, 255, 1),
     textPlaceholder: Color.fromRGBO(173, 170, 170, 1),
     success: Color.fromRGBO(46, 125, 50, 1),
     error: Color.fromRGBO(244, 67, 54, 1),
   );

   @override
   AppColors copyWith({
     Color? primaryMain,
     Color? primaryEmphasis,
     Color? primarySubtle,
     Color? secondaryMain,
     Color? secondaryEmphasis,
     Color? secondarySubtle,
     Color? background,
     Color? surface,
     Color? text,
     Color? textPlaceholder,
     Color? success,
     Color? error,
   }) {
     return AppColors(
       primaryMain: primaryMain ?? this.primaryMain,
       primaryEmphasis: primaryEmphasis ?? this.primaryEmphasis,
       primarySubtle: primarySubtle ?? this.primarySubtle,
       secondaryMain: secondaryMain ?? this.secondaryMain,
       secondaryEmphasis: secondaryEmphasis ?? this.secondaryEmphasis,
       secondarySubtle: secondarySubtle ?? this.secondarySubtle,
       background: background ?? this.background,
       surface: surface ?? this.surface,
       text: text ?? this.text,
       textPlaceholder: textPlaceholder ?? this.textPlaceholder,
       success: success ?? this.success,
       error: error ?? this.error,
     );
   }

   @override
   AppColors lerp(ThemeExtension<AppColors>? other, double t) {
     if (other is! AppColors) return this;
     return AppColors(
       primaryMain: Color.lerp(primaryMain, other.primaryMain, t)!,
       primaryEmphasis: Color.lerp(primaryEmphasis, other.primaryEmphasis, t)!,
       primarySubtle: Color.lerp(primarySubtle, other.primarySubtle, t)!,
       secondaryMain: Color.lerp(secondaryMain, other.secondaryMain, t)!,
       secondaryEmphasis: Color.lerp(secondaryEmphasis, other.secondaryEmphasis, t)!,
       secondarySubtle: Color.lerp(secondarySubtle, other.secondarySubtle, t)!,
       background: Color.lerp(background, other.background, t)!,
       surface: Color.lerp(surface, other.surface, t)!,
       text: Color.lerp(text, other.text, t)!,
       textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
       success: Color.lerp(success, other.success, t)!,
       error: Color.lerp(error, other.error, t)!,
     );
   }
 }




