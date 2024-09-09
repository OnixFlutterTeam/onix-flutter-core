import 'package:example/base_bloc_example/bloc/base_bloc_example_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'base_bloc_example/base_bloc_example_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerFactory<BaseBlocExampleScreenBloc>(
      BaseBlocExampleScreenBloc.new);

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
        '/base_bloc_example': (context) =>
            const BaseBlocExampleScreen(title: 'Base BLoC Example'),
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
            ElevatedButton(onPressed: () {}, child: const Text('Base Cubit')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/base_bloc_example'),
                child: const Text('Base BLoC')),
          ],
        ),
      ),
    );
  }
}
