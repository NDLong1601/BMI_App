import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/screens/set_state/bmi_calculator_set_state_screen.dart';
import 'package:bmi_app/screens/spash_screen.dart';
import 'package:bmi_app/screens/stateful_builder/bmi_calculator_stateful_builder_screen.dart';
import 'package:bmi_app/screens/value_listenable_builder/bmi_calculator_value_listenable_builder_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String splashScreen = '/splashScreen';
  static const String calculatorSetStateScreen = '/calculator_Set_State_Screen';
  static const String calculatorStatefulBuilderScreen =
      '/calculator_Stateful_Builder_Screen';
  static const String calculatorValueListenableBuilderScreen =
      '/calculator_Value_Listenable_builder_Screen';
  static const String resultScreen = '/resultScreen';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoute.splashScreen: (context) => const SplashScreen(),
    AppRoute.calculatorSetStateScreen: (context) =>
        const BmiCalculatorSetStateScreen(),
    AppRoute.calculatorStatefulBuilderScreen: (context) =>
        const BmiCalculatorStatefulBuilderScreen(),
    AppRoute.calculatorValueListenableBuilderScreen: (context) =>
        const BmiCalculatorValueListenableBuilderScreen(),
    AppRoute.resultScreen: (context) => const ResultScreen(),
  };
}
