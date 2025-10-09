part of '../../app_router.dart';

@TypedGoRoute<LoginRoute>(path: AppRoutes.login,
routes: [forgout])
 class LoginRoute extends GoRouteData with _$LoginRoute{
 const  LoginRoute();
   
   @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
 }


const forgout = TypedGoRoute<ForgoutPasswordRouter>(path: AppRoutes.forgoutPassword);
 class ForgoutPasswordRouter extends GoRouteData with _$ForgoutPasswordRouter{
 const  ForgoutPasswordRouter();

   @override
  Widget build(BuildContext context, GoRouterState state) {
    return ForgoutPasswordPage();
  }
 }

