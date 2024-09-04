import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_core/core/arch/logger/app_logger_impl.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.d('$event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.d('$stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
