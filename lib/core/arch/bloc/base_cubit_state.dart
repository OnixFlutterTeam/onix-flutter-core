import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_core/core/arch/bloc/base_cubit.dart';
import 'package:onix_flutter_core/core/arch/bloc/bloc_builders_mixin.dart';
import 'package:onix_flutter_core/core/arch/bloc/bloc_typedefs.dart';
import 'package:onix_flutter_core/core/arch/bloc/stream_listener.dart';
import 'package:onix_flutter_core/core/arch/domain/entity/progress_state/progress_state.dart';

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

  C createCubit() => GetIt.I.get<C>();

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

  void onCubitCreated(BuildContext context, C cubit) {
    cubit.progressStream.listen((event) async {
      if (event is DefaultProgressState) {
        if (event.showProgress) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      }
    });
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);
}
