import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/screens/set_state/bmi_calculator_set_state_screen.dart';
import 'package:bmi_app/screens/spash_screen.dart';
import 'package:bmi_app/screens/stateful_builder/bmi_calculator_stateful_builder_screen.dart';
import 'package:bmi_app/screens/value_listenable_builder/bmi_calculator_value_listenable_builder_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/calculator_Set_State_Screen': (context) =>
            const BmiCalculatorSetStateScreen(),
        '/calculator_Stateful_Builder_Screen': (context) =>
            const BmiCalculatorStatefulBuilderScreen(),
        '/calculator_Value_Listenable_builder_Screen': (context) =>
            const BmiCalculatorValueListenableBuilderScreen(),
        '/resultScreen': (context) => const ResultScreen(),
      },
    );
  }
}
