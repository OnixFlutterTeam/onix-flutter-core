part of 'base_bloc_example_screen_bloc.dart';

@immutable
sealed class BaseBlocExampleScreenSR {}

final class BaseBlocExampleScreenSRShowDialog extends BaseBlocExampleScreenSR {
  final String message;

  BaseBlocExampleScreenSRShowDialog(this.message);
}
