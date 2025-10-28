import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme_mobile.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/ButtonsLogin.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/form_login.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/presentation_login.dart';
import 'package:nexus_multiplatform/utils/responsive_ultils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Future<String> _precacheFutureSvg;
  late Future<void> _precacheFutureImages;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {

      _precacheFutureImages = _precacheAssets();
      _initialized = true;
    }
    _precacheFutureSvg = _loadAndReplaceSvgColor(
      'assets/icons/rafiki.svg',
      Theme.of(context).colorScheme.onPrimary,
    );
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
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        }
        final svgString = snapshot.data![1] as String; // o SVG processado

        final device = Responsive.getDeviceType(context);

        switch (device) {
          case DeviceScreenType.mobile:
            return buildMobile(context, svgString);
          case DeviceScreenType.tablet:
            return buildTablet(context, svgString);
          case DeviceScreenType.desktop:
            return buildDesktop(device, svgString, context);
        }
      },
    );
  }

  buildDesktop(
    DeviceScreenType device,
    String svgString,
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            Expanded(flex: 1, child: PresentationLogin(svgString: svgString, title: 'Seja bem-vindo!',)),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 250),
                    child: Column(
                      spacing: 43,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          spacing: 7,
                          children: [
                            Text(
                              'Bem vindo de volta ao NEXUS ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            Text(
                              'Insira seu email e senha para acessar sua conta',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                          ],
                        ),
                        FormLogin(formKey: _formKey),
                        ButtonsLogin(
                          googleLoginOnPressed: () {},
                          loginOnPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold buildMobile(BuildContext context, String svgString) {
    return Scaffold(
      backgroundColor: backGround,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 67.0,bottom: 33),
                      child: PresentationLogin(svgString: svgString, title: 'Seja bem-vindo!'),
                    ),
                    FormLogin(formKey: _formKey),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27.0,),
                      child: ButtonsLogin(
                        googleLoginOnPressed: () {},
                        loginOnPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildTablet(BuildContext context, String svgString) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.inverseSurface,
        child: Row(
          children: [
            Expanded(flex: 1, child: PresentationLogin(svgString: svgString, title: 'Seja bem-vindo!')),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 250),
                    child: Column(
                      spacing: 43,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          spacing: 7,
                          children: [
                            Text(
                              'Bem vindo de volta ao NEXUS ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                            ),
                            Text(
                              'Insira seu email e senha para acessar sua conta',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                            ),
                          ],
                        ),
                        FormLogin(formKey: _formKey),
                        ButtonsLogin(
                          googleLoginOnPressed: () {},
                          loginOnPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
