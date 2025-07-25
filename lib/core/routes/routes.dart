import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_journal_ai/helper/extension/base_extension.dart';

import '../../presentation/screens/auth/admin_signup_screen .dart';
import '../../presentation/screens/auth/forgot_password_screen.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/password_reset_confirm_screen.dart';
import '../../presentation/screens/auth/set_new_password_screen.dart';
import '../../presentation/screens/auth/update_password_success_screen.dart';
import '../../presentation/screens/auth/verify_code_screen.dart';

import '../../presentation/screens/chatbot/chatbot_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/main/main_screen.dart';
import '../../presentation/screens/report/report_screen.dart';
import '../../presentation/screens/settings/setting_screen.dart';
import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../../presentation/screens/welcome/welcome_screen.dart';
import '../../presentation/widgets/error_screen/error_screen.dart';
import '../../presentation/widgets/payment_modal/payment_modal.dart';
// import '../../presentation/screens/main/main_screen_with_bottom_nav.dart';
import 'route_observer.dart';
import 'route_path.dart';

class AppRouter {
  static GoRouter? _router;

  static Widget _fadeTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  // Add this method for backward compatibility
  static void refreshRouter() {
    _router = null;
  }

  static GoRouter get route {
    _router ??= GoRouter(
      initialLocation: RoutePath.splashScreen.addBasePath,
      debugLogDiagnostics: true,
      routes: [
        ///======================= Splash Route =======================
        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),

        ///======================= Welcome Route =======================
        GoRoute(
          name: RoutePath.welcomeScreen,
          path: RoutePath.welcomeScreen.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: WelcomeScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),

        ///======================= Error Route =======================
        GoRoute(
          name: RoutePath.errorScreen,
          path: RoutePath.errorScreen.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ErrorPage(),
            transitionsBuilder: _fadeTransition,
          ),
        ),

        ///======================= Auth Routes =======================
        GoRoute(
          name: RoutePath.login,
          path: RoutePath.login.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: LoginScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.adminSignUp,
          path: RoutePath.adminSignUp.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const AdminSignUpScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.forgotPass,
          path: RoutePath.forgotPass.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ForgotPasswordScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.resetPassConfirm,
          path: RoutePath.resetPassConfirm.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const PasswordResetConfirmScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.resetPass,
          path: RoutePath.resetPass.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SetPasswordScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.verification,
          path: RoutePath.verification.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const CodeVerificationScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.resetPasswordSuccess,
          path: RoutePath.resetPasswordSuccess.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: UpdatePasswordSuccessScreen(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        GoRoute(
          name: RoutePath.paymentModal,
          path: RoutePath.paymentModal.addBasePath,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const PaymentModal(),
            transitionsBuilder: _fadeTransition,
          ),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MainScreenWithBottomNav(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePath.home.addBasePath,
                  name: RoutePath.home,
                  builder: (context, state) => HomeScreen(),
                  routes: [
                    // GoRoute(
                    //   path: 'details/:id',
                    //   builder: (context, state) => HomeDetailsScreen(
                    //     id: state.pathParameters['id']!,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePath.report.addBasePath,
                  name: RoutePath.report,
                  builder: (context, state) => ReportScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePath.chatbot.addBasePath,
                  name: RoutePath.chatbot,
                  builder: (context, state) => ChatbotScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePath.settings.addBasePath,
                  name: RoutePath.settings,
                  builder: (context, state) => SettingScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
      observers: [routeObserver],
    );
    return _router!;
  }
}
