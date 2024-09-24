import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/bloc_typedefs.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/mixins/bloc_builders_mixin.dart';
import 'package:onix_flutter_core/src/core/arch/bloc/stream_listener.dart';

abstract class BaseState<S, B extends BaseBloc<dynamic, S, SR>, SR,
        W extends StatefulWidget> extends State<W>
    with BlocBuildersMixin<B, S, SR> {
  bool lazyBloc = false;
  B? _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (context) {
        final bloc = createBloc();
        _bloc = bloc;
        onBlocCreated(context, bloc);
        _attachListeners(context, bloc);
        return bloc;
      },
      lazy: lazyBloc,
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
    if (_bloc != null) {
      _bloc?.dispose();
    }
    super.dispose();
  }

  B blocOf(BuildContext context) => context.read<B>();

  B createBloc();

  Widget srObserver({
    required BuildContext context,
    required Widget child,
    required SingleResultListener<SR> onSR,
  }) {
    return StreamListener<SR>(
      stream: (_bloc ?? blocOf(context)).singleResults,
      onData: (data) {
        onSR(context, data);
      },
      child: child,
    );
  }

  void onBlocCreated(BuildContext context, B bloc) {}

  void onFailure(BuildContext context, B bloc, Failure failure) {}

  void onSR(BuildContext context, B bloc, SR sr) {}

  void onProgress(BuildContext context, B bloc, BaseProgressState progress) {
    if (progress is DefaultProgressState) {
      if (progress.showProgress) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    }
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);

  void _attachListeners(BuildContext context, B bloc) {
    bloc.failureStream.listen((failure) {
      if (!context.mounted) return;
      onFailure(context, bloc, failure);
    });

    bloc.singleResults.listen((sr) {
      if (!context.mounted) return;
      onSR(context, bloc, sr);
    });

    bloc.progressStream.listen((progress) {
      if (!context.mounted) return;
      onProgress(context, bloc, progress);
    });
  }
}
