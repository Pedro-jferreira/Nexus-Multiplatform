import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_multiplatform/ui/features/auth/forgout_password/widgets/request_forgot.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/presentation_login.dart';

import '../../../../utils/responsive_ultils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late Future<String> _precacheFutureSvg;
  late Future<void> _precacheFutureImages;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _precacheFutureSvg = _loadAndReplaceSvgColor(
        'assets/icons/rafiki.svg',
        Theme.of(context).colorScheme.onPrimary,
      );
      _precacheFutureImages = _precacheAssets();
      _initialized = true;
    }
  }

  Future<void> _precacheAssets() async {
    await Future.wait([
      precacheImage(
        const AssetImage('assets/logos/Logo_sigla_branco.png'),
        context,
      ),
      precacheImage(const AssetImage('assets/icons/google.png'), context),
    ]);

    const loader = SvgAssetLoader('assets/icons/rafiki.svg');
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }

  Future<String> _loadAndReplaceSvgColor(
    String assetPath,
    Color newColor,
  ) async {
    final color =
        '#${newColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
    final svgString = await rootBundle.loadString(assetPath);
    return svgString
        .replaceAll('#EBEBEB', color)
        .replaceAll('#E6E6E6', color)
        .replaceAll('#F5F5F5', color)
        .replaceAll('#F0F0F0', color)
        .replaceAll('#E0E0E0', color);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_precacheFutureImages, _precacheFutureSvg]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        }
        final svgString = snapshot.data![1] as String; // o SVG processado

        final device = Responsive.getDeviceType(context);

        return buildMobile(svgString, device);
      },
    );
  }

  buildMobile(String svgString, device) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: device == DeviceScreenType.mobile
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              spacing: device == DeviceScreenType.mobile? 0:5,
              children: [
                if (device == DeviceScreenType.mobile)
                  PresentationLogin(
                    svgString: svgString,
                    title: 'Recuperar Senha?',
                  ),
                if (device != DeviceScreenType.mobile)
                  Column(
                    spacing: 55.7,
                    children: [
                      SvgPicture.string(svgString),
                      Text(
                        'Esqueceu sua senha?',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                RequestForgot(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
