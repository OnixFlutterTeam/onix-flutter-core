import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_bloc_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerFactory<HomePageBloc>(HomePageBloc.new);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState
    extends BaseState<HomePageState, HomePageBloc, HomePageSR, MyHomePage> {
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
                '${state is HomePageData ? state.counter : 0}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => blocOf(context).add(HomePageEventOnIncrement()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomePageBloc extends BaseBloc<HomePageEvent, HomePageState, HomePageSR> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageEventOnIncrement>((event, emit) {
      int counter = state is HomePageData ? (state as HomePageData).counter : 0;

      emit(HomePageData(counter + 1));
    });
  }
}

@immutable
abstract class HomePageEvent {}

final class HomePageEventOnIncrement extends HomePageEvent {}

@immutable
abstract class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageData extends HomePageState {
  final int counter;

  HomePageData(this.counter);
}

@immutable
abstract class HomePageSR {}

final class HomePageSRShowDialog extends HomePageSR {
  final String message;

  HomePageSRShowDialog(this.message);
}
