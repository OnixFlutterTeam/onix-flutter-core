import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/progress_stream_mixin.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/sr_cubit_mixin.dart';

import 'failure_stream_mixin.dart';

abstract class BaseCubit<State, SR> extends Cubit<State>
    with
        SingleResultCubitMixin<State, SR>,
        ProgressStreamMixin,
        FailureStreamMixin {
  BaseCubit(super.initialState);

  void dispose() {
    closeProgressStream();
    closeFailureStream();
  }
}
