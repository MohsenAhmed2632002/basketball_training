import 'package:basketball_training/core/Theming/Font.dart';
import "package:flutter/material.dart";

class MaterialTheme {
  final BuildContext context;

  MaterialTheme({
    required this.context,
  });

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(186, 50, 31, 0),
      surfaceTint: Color.fromARGB(255, 43, 38, 31),
      onPrimary: Color(4278195007),
      primaryContainer: Color(4286418888),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289383935),
      onSecondary: Color(4278196015),
      secondaryContainer: Color(4285436869),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293312480),
      onTertiary: Color(4280618277),
      tertiaryContainer: Color(4289300133),
      onTertiaryContainer: Color(4278190080),
      error: Color(4290497023),
      onError: Color(4278194499),
      errorContainer: Color(4286549704),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294769407),
      onSurfaceVariant: Color(4291480276),
      outline: Color(4288783020),
      outlineVariant: Color(4286677644),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124841),
      inversePrimary: Color(4281550458),
      primaryFixed: Color(4292600319),
      onPrimaryFixed: Color(4278193716),
      primaryFixedDim: Color(4289971711),
      onPrimaryFixedVariant: Color(4280300647),
      secondaryFixed: Color(4292076799),
      onSecondaryFixed: Color(4278194727),
      secondaryFixedDim: Color(4288924158),
      onSecondaryFixedVariant: Color(4278531940),
      tertiaryFixed: Color(4294956792),
      onTertiaryFixed: Color(4280223776),
      tertiaryFixedDim: Color(4292983772),
      onTertiaryFixedVariant: Color(4282920263),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme(), context);
  }

  ThemeData theme(ColorScheme colorScheme, BuildContext context) => ThemeData(
        //هنا الثيم
        useMaterial3: true,
        fontFamily: FontConstants.fontFamily,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            // style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Colors.orange,
            ),

            //   minimumSize: WidgetStatePropertyAll(
            // GET https://api.weatherapi.com/v1/forecast.json?key=f5e657f7a0484ab5b25173533231907&q=Egypt&days=5&aqi=no&alerts=no
//     APIKEYf5e657f7a0484ab5b25173533231907
            //     Size(f5e657f7a0484ab5b25173533231907
            //       MediaQuery.of(context).size.width / 2,
            //       50,
            //     ),
            //   ),
            // ),
            // fixedSize: MaterialStatePropertyAll(
            //   Size(
            //     MediaQuery.sizeOf(context).width / 2,
            //     65,
            //   ),
            // ),
            // elevation: MaterialStatePropertyAll(7),
            // backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          suffixIconColor: colorScheme.primary,
          fillColor: Colors.white,
          labelStyle: getRegulerTextStyle(
            context: context,
            fontSize: 20,
            color: Colors.orangeAccent,
          ),
          hintStyle: getRegulerTextStyle(
            context: context,
            fontSize: 12,
            color: Colors.orange,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 1.3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
          ),
          errorStyle: getRegulerTextStyle(
            context: context,
            fontSize: 10,
            color: Colors.red,
          ),
        ),
        scaffoldBackgroundColor: colorScheme.primary,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
