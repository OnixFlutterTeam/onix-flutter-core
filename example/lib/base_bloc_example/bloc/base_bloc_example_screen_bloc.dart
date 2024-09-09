import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_bloc.dart';

part 'base_bloc_example_screen_event.dart';
part 'base_bloc_example_screen_state.dart';
part 'base_bloc_example_screen_sr.dart';

class BaseBlocExampleScreenBloc extends BaseBloc<BaseBlocExampleScreenEvent,
    BaseBlocExampleScreenState, BaseBlocExampleScreenSR> {
  BaseBlocExampleScreenBloc() : super(BaseBlocExampleScreenInitial()) {
    on<BaseBlocExampleScreenEventOnIncrement>((event, emit) {
      int counter = state is BaseBlocExampleScreenData
          ? (state as BaseBlocExampleScreenData).counter
          : 0;

      emit(BaseBlocExampleScreenData(counter + 1));
    });
  }
}
