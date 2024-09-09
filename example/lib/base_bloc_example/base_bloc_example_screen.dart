import 'package:example/base_bloc_example/bloc/base_bloc_example_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_bloc_state.dart';

class BaseBlocExampleScreen extends StatefulWidget {
  const BaseBlocExampleScreen({super.key, required this.title});

  final String title;

  @override
  State<BaseBlocExampleScreen> createState() => _BaseBlocExampleScreenState();
}

class _BaseBlocExampleScreenState extends BaseState<BaseBlocExampleScreenState,
    BaseBlocExampleScreenBloc, BaseBlocExampleScreenSR, BaseBlocExampleScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
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
                '${state is BaseBlocExampleScreenData ? state.counter : 0}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            blocOf(context).add(BaseBlocExampleScreenEventOnIncrement()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
