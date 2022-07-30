import '../modules/debts/views/add_borrowed_page.dart';

import '../modules/goals/goal/bindings/goal_binding.dart';
import '../modules/goals/goal/views/goal_view.dart';
import '../modules/goals/year_goal_chalenge/views/year_goal_challenge_detail_view.dart';
import '../modules/settings/views/language_view.dart';
import '../modules/goals/year_goal_chalenge/bindings/year_goal_challenge_binding.dart';
import '../modules/goals/year_goal_chalenge/views/year_goal_challenge_add_view.dart';
import '../modules/goals/year_goal_chalenge/views/year_goal_challenge_preview_view.dart';
import '../modules/goals/year_goal_chalenge/views/year_goal_challenge_view.dart';
import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/debts/bindings/debts_binding.dart';
import '../modules/debts/views/debts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_theme_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    /// DEBTS *************
    GetPage(
      name: _Paths.DEBTS,
      page: () => DebtsView(),
      binding: DebtsBinding(),
    ),
    GetPage(
      name: _Paths.DEBTS_ADD,
      page: () => AddDebtsPage(),
      binding: DebtsBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    //Goal ********
    GetPage(
      name: _Paths.GOAL,
      page: () => const GoalView(),
      binding: GoalBinding(),
    ),

    /// YEAR GOAL CHANLLENGE *****
    GetPage(
      name: _Paths.YEAR_GOAL_CHALLENGE,
      page: () => YearGoalChallengeView(),
      binding: YearGoalChalengeBinding(),
    ),
    GetPage(
      name: _Paths.YEAR_GOAL_CHALLENGE_ADD,
      page: () => YearGoalChallengeAddView(),
      binding: YearGoalChalengeBinding(),
    ),
    GetPage(
      name: _Paths.YEAR_GOAL_CHALLENGE_PREVIEW,
      page: () => YearGoalChallengePreviewView(),
      binding: YearGoalChalengeBinding(),
    ),
    GetPage(
      name: _Paths.YEAR_GOAL_CHALLENGE_DETAIL,
      page: () => YearGoalChallengeDetailView(),
      binding: YearGoalChalengeBinding(),
    ),
    //SETTINGS
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_THEME,
      page: () => SettingsThemeView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_LANGUAGE,
      page: () => LanguageView(),
      binding: SettingsBinding(),
    ),
  ];
}
