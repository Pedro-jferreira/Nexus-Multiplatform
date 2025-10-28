part of '../../app_router.dart';

@TypedGoRoute<LoginRoute>(path: AppRoutes.login,
routes: [forgotPassword])
 class LoginRoute extends GoRouteData with _$LoginRoute{
 const  LoginRoute();
   
   @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage(viewModel: LoginViewModel(repository: context.read()),);
  }
 }


const forgotPassword = TypedGoRoute<ForgotPasswordRouter>(path: AppRoutes.forgoutPassword);
 class ForgotPasswordRouter extends GoRouteData with _$ForgotPasswordRouter{
 const  ForgotPasswordRouter();

   @override
  Widget build(BuildContext context, GoRouterState state) {
    return ForgotPasswordPage();
  }
 }

