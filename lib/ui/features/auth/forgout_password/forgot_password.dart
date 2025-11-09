import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_multiplatform/ui/core/theme/theme_mobile.dart';
import 'package:nexus_multiplatform/ui/features/auth/forgout_password/widgets/request_forgot.dart';
import 'package:nexus_multiplatform/ui/features/auth/login/widgets/presentation_login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/responsive_utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late Future<void> _precacheFutureImages;
  late Future<String> _precacheSvg;
  bool _initialized = false;
  bool _hasSend = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _precacheFutureImages = _precacheAssets();
    }
    _precacheSvg = _precacheSvgFuture();

  }

  Future<void> _precacheAssets() async {
    await Future.wait([
      precacheImage(
        const AssetImage('assets/logos/Logo_sigla_branco.png'),
        context,
      ),
      precacheImage(const AssetImage('assets/icons/google.png'), context),
      precacheImage(const AssetImage('assets/images/password.png'), context),
    ]);
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

  Future<String> _precacheSvgFuture() async {
    return await _loadAndReplaceSvgColor(
      'assets/icons/rafiki.svg',
      Theme.of(context).colorScheme.onSurface,
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = Responsive.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? FutureBuilder(
            future: Future.wait([_precacheFutureImages,_precacheSvg]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting  && !_initialized) {
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
              }      _initialized = true;

              return buildContent(device, null);
            },
          )
        : FutureBuilder(
            future: Future.wait([_precacheFutureImages, _precacheSvg]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting && !_initialized) {
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
              }_initialized = true;

              final svgString = snapshot.data?[1] as String? ?? '';

              return buildContent(device, svgString);
            },
          );
  }

  buildContent(device, String? svg) {
    return Scaffold(
      backgroundColor:device == DeviceScreenType.mobile ? backGround: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: text,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: !_hasSend
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: device == DeviceScreenType.mobile
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  spacing: device == DeviceScreenType.mobile ? 0 : 5,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0, bottom: 44),
                      child: PresentationLogin(
                        title: 'Link Enviado!',
                        imgPath: 'assets/images/sent-message.png',
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16,
                        bottom: 50,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 291),
                        child: Column(
                          spacing: 43,
                          children: [
                            Text(
                              'Instruções para redefinir sua senha foram enviadas para o e-mail fornecido, caso ele esteja cadastrado.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: text,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () async {
                                  // Tentamos abrir um aplicativo de e-mail
                                  final Uri emailUri = Uri(scheme: 'mailto');

                                  // Verifica se há app que lide com o esquema mailto:
                                  if (await canLaunchUrl(emailUri)) {
                                    await launchUrl(
                                      emailUri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                    return;
                                  }

                                  // Se não houver, tenta abrir o Gmail (web ou app, dependendo do sistema)
                                  final Uri gmailUri = Uri.parse(
                                    'https://mail.google.com/mail/u/0/#inbox',
                                  );
                                  await launchUrl(
                                    gmailUri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  backgroundColor: secondaryMain,
                                  foregroundColor: surface,
                                ),
                                child: const Text('Abrir e-mail'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              :device == DeviceScreenType.mobile?buildContentMobile(context):buildContentWeb(context, svg!),
        ),
      ),
    );
  }

  buildContentMobile(context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0, bottom: 44),
            child: PresentationLogin(title: 'Recuperar Senha?'),
          ),

        RequestForgot(),
      ],
    );
  }
  buildContentWeb(context, svg){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
          Column(
            spacing: 51,
            children: [
              SvgPicture.string(svg, height: 131.3),
              Text(
                'Esqueceu sua senha?',
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        RequestForgot(),
      ],
    );
  }
}
