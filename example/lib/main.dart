import 'package:example/base_bloc_example/base_bloc_example_screen.dart';
import 'package:example/base_cubit_example/base_cubit_example_screen.dart';
import 'package:example/base_api_client_example/base_api_client_example.dart';
import 'package:example/di.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDi(GetIt.I);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/base_cubit_example': (context) =>
            const BaseCubitExampleScreen(title: 'Base Cubit Example'),
        '/base_bloc_example': (context) =>
            const BaseBlocExampleScreen(title: 'Base BLoC Example'),
        '/base_api_client_example': (context) =>
            const BaseApiClientExample(title: 'Base API Client Example'),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Onix Flutter Core Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/base_cubit_example'),
              child: const Text('Base Cubit'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/base_bloc_example'),
              child: const Text('Base BLoC'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/base_api_client_example'),
              child: const Text('Base API Client'),
            ),
          ],
        ),
      ),
    );
  }
}
