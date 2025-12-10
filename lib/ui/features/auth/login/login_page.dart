
import 'package:Nexus/ui/features/auth/login/locked_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:Nexus/ui/core/theme/theme.dart';
import 'package:Nexus/ui/core/theme/theme_mobile.dart';
import 'package:Nexus/ui/features/auth/login/viewmodel/login_view_model.dart';
import 'package:Nexus/ui/features/auth/login/widgets/ButtonsLogin.dart';
import 'package:Nexus/ui/features/auth/login/widgets/form_login.dart';
import 'package:Nexus/ui/features/auth/login/widgets/presentation_login.dart';
import 'package:Nexus/utils/responsive_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:result_command/result_command.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

import '../../../../config/notifications.dart';
import '../../../../domain/validators/auth_validators.dart';
import '../../../../exceptions/app_exceptions.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginPage({super.key, required this.viewModel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Future<String> _precacheFutureSvg;
  late Future<void> _precacheFutureImages;
  bool _initialized = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  bool _showPassword = false;
  bool _contaBloqueada = false;

  final validator = LoginParamValidation();
  final loginParamDto = LoginParamDto.empty();

  void _togglePasswordVisibility() {
    setState(() => _showPassword = !_showPassword);
  }

  void _onSubmit() {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.validate()) return;

    if (widget.viewModel.loginCmd.value.isRunning) return;

    widget.viewModel.loginCmd.execute(
      LoginRequest(
        email: loginParamDto.email.trim().toLowerCase(),
        password: loginParamDto.password,
      ),
    );
  }

  @override
  void initState() {
    widget.viewModel.loginCmd.addListener(_handlerLoginCmd);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkNotificationPermission();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    if (widget.viewModel.loginCmd != oldWidget.viewModel.loginCmd) {
      oldWidget.viewModel.loginCmd.removeListener(_handlerLoginCmd);
      widget.viewModel.loginCmd.addListener(_handlerLoginCmd);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.viewModel.loginCmd.removeListener(_handlerLoginCmd);
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  _handlerLoginCmd() {
    final cmd = widget.viewModel.loginCmd;
    final status = cmd.value;
    switch (status) {
      case FailureCommand<UserResponse>():
        final error = status.error;
        String message = (error is AppException)
            ? error.message
            : 'Erro desconhecido.';
        final statusSode =  (error is AppException)
            ? error.statusCode: null;

        if(statusSode != null && (statusSode == 401 || statusSode == 409)){
          if(message == 'Conta bloqueada' || message == 'Conta desabilitada'){
            setState(() {
              _contaBloqueada = true;
            });
            message = 'Conta bloqueada';
          }else{ message = 'credenciais invalidas';}



        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error ao realizar login: $message'),
            backgroundColor: Theme.of(
              context,
            ).colorScheme.error, // Deixa o snackbar vermelho
          ),
        );
        cmd.reset();
        break;
      case SuccessCommand<UserResponse>():
        _showSuccessOverlay(status.value.name);
        cmd.reset();
        break;

      default:
        return;
    }
  }

  void _showSuccessOverlay(String userName) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        final theme = Theme.of(context);
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: 0,
          right: 0,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 320, // limite máximo da largura
                    minWidth: 200,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: context.successColor,
                        size: 72,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Bem-vindo de volta, $userName!',
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 2), () {
      entry.remove();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _precacheFutureImages = _precacheAssets();
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

  void _showNotificationRequiredModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text("Permissão Obrigatória"),
            content: Text(
              kIsWeb
                  ? "Para receber alertas urgentes, ative as notificações no navegador.\n\n"
                        "Chrome: cadeado ao lado da URL → Permissões → Notificações → Permitir\n"
                        "Firefox: ícone de permissões → Notificações → Permitir"
                  : "Para receber alertas urgentes, você precisa ativar as notificações no dispositivo.",
            ),
            actions: [
              TextButton(
                child: const Text(kIsWeb?'Já aceitei':"Ativar"),
                onPressed: () async {
                  final settings = await FirebaseMessaging.instance
                      .requestPermission();

                  if (settings.authorizationStatus ==
                      AuthorizationStatus.authorized) {
                    await setupNotifications();
                    Navigator.pop(context);
                    return;
                  }

                  // WEB → apenas instrução
                  if (kIsWeb) {
                    _showSettingsDialog();
                    return;
                  }

                  // MOBILE → abre configurações
                  _showSettingsDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ativar Notificações"),
        content: Text(
          kIsWeb
              ? "Vá nas configurações do navegador e permita notificações para este site."
              : "Para permitir as notificações, abra as configurações do app.",
        ),
        actions: [
          TextButton(
            child: const Text("Abrir Configurações"),
            onPressed: () async {
              if (!kIsWeb) {
                // MOBILE
                await openAppSettings();
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _checkNotificationPermission() async {
    if (kIsWeb) {
       setupNotifications();
    } else {
      await setupNotifications();
    }

    final settings = await FirebaseMessaging.instance.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return; // Tudo certo
    }

    _showNotificationRequiredModal();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_precacheFutureImages, _precacheFutureSvg]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !_initialized) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        }
        _initialized = true;
        final svgString = snapshot.data![1] as String; // o SVG processado

        final device = Responsive.getDeviceType(context);

        if(_contaBloqueada){
         return LockedPage(
           viewModel:widget.viewModel ,
           onPressed: (){
           setState(() {
             _contaBloqueada = !_contaBloqueada;
           });
         },);
        }

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
            Expanded(
              flex: 1,
              child: PresentationLogin(
                svgString: svgString,
                title: 'Seja bem-vindo!',
              ),
            ),
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
                        ListenableBuilder(
                          listenable: widget.viewModel.loginCmd,
                          builder: (context, _) {
                            return Column(
                              spacing: 27,
                              children: [
                                FormLogin(
                                  formKey: _formKey,
                                  loginParamDto: loginParamDto,
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                  emailFocus: _emailFocus,
                                  passwordFocus: _passwordFocus,
                                  showPassword: _showPassword,
                                  onTogglePassword: _togglePasswordVisibility,
                                  validator: validator,
                                  onSubmit: _onSubmit,
                                  disabled:
                                      widget.viewModel.loginCmd.value.isRunning,
                                ),
                                ButtonsLogin(
                                  googleLoginOnPressed: () {},
                                  loginOnPressed: _onSubmit,
                                  isLoading:
                                      widget.viewModel.loginCmd.value.isRunning,
                                ),
                              ],
                            );
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
      backgroundColor: context.colors.background,
      body: ListenableBuilder(
        listenable: widget.viewModel.loginCmd,
        builder: (context, _) {
          if (widget.viewModel.loginCmd.value.isRunning) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
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
                          padding: EdgeInsets.only(top: 67.0, bottom: 33),
                          child: PresentationLogin(
                            svgString: svgString,
                            title: 'Seja bem-vindo!',
                          ),
                        ),
                        FormLogin(
                          formKey: _formKey,
                          loginParamDto: loginParamDto,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          emailFocus: _emailFocus,
                          passwordFocus: _passwordFocus,
                          showPassword: _showPassword,
                          onTogglePassword: _togglePasswordVisibility,
                          validator: validator,
                          onSubmit: _onSubmit,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 27.0),
                          child: ButtonsLogin(
                            isLoading:
                                widget.viewModel.loginCmd.value.isRunning,
                            googleLoginOnPressed: () {},
                            loginOnPressed: _onSubmit,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildTablet(BuildContext context, String svgString) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: PresentationLogin(
                svgString: svgString,
                title: 'Seja bem-vindo!',
              ),
            ),
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
                        ListenableBuilder(
                          listenable: widget.viewModel.loginCmd,
                          builder: (context, _) {
                            return Column(
                              spacing: 27,
                              children: [
                                FormLogin(
                                  formKey: _formKey,
                                  loginParamDto: loginParamDto,
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                  emailFocus: _emailFocus,
                                  passwordFocus: _passwordFocus,
                                  showPassword: _showPassword,
                                  onTogglePassword: _togglePasswordVisibility,
                                  validator: validator,
                                  onSubmit: _onSubmit,
                                  disabled:
                                      widget.viewModel.loginCmd.value.isRunning,
                                ),
                                ButtonsLogin(
                                  googleLoginOnPressed: () {},
                                  loginOnPressed: _onSubmit,
                                  isLoading:
                                      widget.viewModel.loginCmd.value.isRunning,
                                ),
                              ],
                            );
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
