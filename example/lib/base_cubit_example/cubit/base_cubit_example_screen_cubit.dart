import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

part 'base_cubit_example_screen_state.dart';
part 'base_cubit_example_screen_sr.dart';

class BaseCubitExampleScreenCubit
    extends BaseCubit<BaseCubitExampleScreenState, BaseCubitExampleScreenSR> {
  BaseCubitExampleScreenCubit() : super(BaseCubitExampleScreenInitial());

  void increment() {
    int counter = state is BaseCubitExampleScreenData
        ? (state as BaseCubitExampleScreenData).counter
        : 0;

    emit(BaseCubitExampleScreenData(counter + 1));
  }
}
