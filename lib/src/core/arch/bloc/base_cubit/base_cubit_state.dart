import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/bloc_typedefs.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/mixins/bloc_builders_mixin.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/stream_listener.dart';
import 'package:onix_flutter_core/src/core/arch/domain/entity/progress_state/progress_state.dart';

abstract class BaseCubitState<S, C extends BaseCubit<S, SR>, SR,
        W extends StatefulWidget> extends State<W>
    with BlocBuildersMixin<C, S, SR> {
  bool lazyCubit = false;
  C? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (context) {
        final cubit = createCubit();
        onCubitCreated(context, cubit);
        _cubit = cubit;
        _attachListeners(context, cubit);
        return cubit;
      },
      lazy: lazyCubit,
      child: Builder(
        builder: (context) {
          initParams(context);
          return buildWidget(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_cubit != null) {
      _cubit?.dispose();
    }
    super.dispose();
  }

  C cubitOf(BuildContext context) => context.read<C>();

  C createCubit();

  Widget srObserver({
    required BuildContext context,
    required Widget child,
    required SingleResultListener<SR> onSR,
  }) {
    return StreamListener<SR>(
      stream: (_cubit ?? cubitOf(context)).singleResults,
      onData: (data) {
        onSR(context, data);
      },
      child: child,
    );
  }

  void onCubitCreated(BuildContext context, C cubit) {}

  void onFailure(BuildContext context, Failure failure) {}

  void onSR(BuildContext context, SR sr) {}

  void onProgress(BuildContext context, BaseProgressState progress) {
    if (progress is DefaultProgressState) {
      if (progress.showProgress) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    }
  }

  void _attachListeners(BuildContext context, C cubit) {
    cubit.failureStream.listen((failure) {
      if (!context.mounted) return;
      onFailure(context, failure);
    });

    cubit.singleResults.listen((sr) {
      if (!context.mounted) return;
      onSR(context, sr);
    });

    cubit.progressStream.listen((progress) {
      if (!context.mounted) return;
      onProgress(context, progress);
    });
  }

// ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);
}
