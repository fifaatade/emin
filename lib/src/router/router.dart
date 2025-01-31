import 'package:emin/src/ui/screens/onboarding/enter_app.dart';
import 'package:emin/src/ui/screens/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';
import '../data/providers/onboardingProvider.dart';
import 'package:provider/provider.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/authentification/signup_screen.dart';
import '../ui/screens/authentification/singin_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final onboardingProvider = Provider.of<OnboardingProvider>(context);
        return onboardingProvider.isFirstTime ? EnterApp() : HomeScreen();
      },
    ),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
        path: '/onboarding', builder: (context, state) => OnboardingScreen()),
    GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/signin', builder: (context, state) => SigninScreen()),
  ],
);
