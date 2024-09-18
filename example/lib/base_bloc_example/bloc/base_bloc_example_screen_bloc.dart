import 'package:flutter/foundation.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

part 'base_bloc_example_screen_event.dart';
part 'base_bloc_example_screen_sr.dart';
part 'base_bloc_example_screen_state.dart';

class BaseBlocExampleScreenBloc extends BaseBloc<BaseBlocExampleScreenEvent,
    BaseBlocExampleScreenState, BaseBlocExampleScreenSR> {
  BaseBlocExampleScreenBloc() : super(BaseBlocExampleScreenInitial()) {
    on<BaseBlocExampleScreenEventOnIncrement>((event, emit) {
      int counter = state is BaseBlocExampleScreenData
          ? (state as BaseBlocExampleScreenData).counter
          : 0;

      emit(BaseBlocExampleScreenData(counter + 1));
      addSr(BaseBlocExampleScreenSRShowDialog('Test dialog'));
      onFailure(ApiFailure(ServerFailure.unknown));
      showProgress();
      hideProgress();
    });
  }
}
