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
        '/calculatorSetStateScreen': (context) => const BmiCalculatorSetStateScreen(),
        '/calculatorStatefulBuilderScreen': (context) => const BmiCalculatorStatefulBuilderScreen(),
        '/calculatorScreen': (context) => const BmiCalculatorValueListenableBuilderScreen(),
        '/resultScreen': (context) => const ResultScreen(),
      },
    );
  }
}

class CaculatorScreen extends StatelessWidget {
  const CaculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    int age = 0;
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // print('arguments: $arguments');
    if (arguments != null) {
      name = arguments['name'] ?? '';
      age = arguments['age'] ?? 0;
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Screen'),
          Text('Name: $name, Age: $age'),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profileScreen');
            },
            child: Text("Go to Profile Screen"),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile Screen'),
          TextButton(
            onPressed: () async {
              // final result = await Navigator.pushNamed(
              //   context,
              //   '/settingScreen',
              // );
              // print('Result from SettingScreen: $result');
            },
            child: Text("Go to Setting Screen"),
          ),
        ],
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SettingScreen Screen'),
          TextButton(
            onPressed: () {
              Navigator.pop(context, {'name': 'Nguyen Van A', 'age': 30});
              // Navigator.popUntil(
              //   context,
              //   (route) => '/homeScreen' == route.settings.name,
              // );
            },
            child: Text("Go to test Screen"),
          ),
        ],
      ),
    );
  }
}

/// setState example
class DemoWidget extends StatefulWidget {
  const DemoWidget({super.key});

  @override
  State<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          const SizedBox(height: 20),
          Text('Counter: $counter'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text('Increment Counter'),
          ),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
        ],
      ),
    );
  }
}

/// StatefulBuilder example
class DemoStatefulBuilder extends StatelessWidget {
  const DemoStatefulBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      body: Column(
        children: [
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          const SizedBox(height: 20),
          CounterWidget(),
          StatefulBuilder(
            builder: (context, innerSetState) {
              return Column(
                children: [
                  Text('Counter: $counter'),
                  ElevatedButton(
                    onPressed: () {
                      innerSetState(() {
                        counter++;
                      });
                    },
                    child: const Text('Increment Counter'),
                  ),
                ],
              );
            },
          ),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Text('Increment Counter'),
        ),
      ],
    );
  }
}

/// ValueListenable Builder example

ValueNotifier<int> counter = ValueNotifier<int>(0);

class DemoValueListenableBuilder extends StatelessWidget {
  const DemoValueListenableBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, child) {
              return Column(
                children: [
                  Text('Counter: $value'),
                  ElevatedButton(
                    onPressed: () {
                      counter.value++;
                    },
                    child: const Text('Increment Counter'),
                  ),
                ],
              );
            },
          ),
          InkWell(
            child: Text('Hello, Flutter!'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TestWidget()),
              );
            },
          ),
          Text('Hello, Flutter!'),
          Text('Hello, Flutter!'),
        ],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, value, child) {
            return Text('Counter: $value');
          },
        ),
      ),
    );
  }
}
