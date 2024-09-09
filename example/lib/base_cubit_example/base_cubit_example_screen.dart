import 'package:example/base_cubit_example/cubit/base_cubit_example_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_cubit_state.dart';

class BaseCubitExampleScreen extends StatefulWidget {
  const BaseCubitExampleScreen({super.key, required this.title});

  final String title;

  @override
  State<BaseCubitExampleScreen> createState() => _BaseCubitExampleScreenState();
}

class _BaseCubitExampleScreenState extends BaseCubitState<
    BaseCubitExampleScreenState,
    BaseCubitExampleScreenCubit,
    BaseCubitExampleScreenSR,
    BaseCubitExampleScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      onSR: _onSR,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              blocBuilder(builder: (context, state) {
                return Text(
                  '${state is BaseCubitExampleScreenData ? state.counter : 0}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => cubitOf(context).increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () => cubitOf(context)
                  .addSr(BaseCubitExampleScreenSRShowDialog('Hello')),
              tooltip: 'Show dialog',
              child: const Icon(Icons.message),
            ),
          ],
        ),
      ),
    );
  }

  void _onSR(BuildContext context, BaseCubitExampleScreenSR sr) {
    if (sr is BaseCubitExampleScreenSRShowDialog) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Cubit dialog'),
            content: Text(sr.message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
