part of 'base_bloc_example_screen_bloc.dart';

@immutable
sealed class BaseBlocExampleScreenEvent {}

final class BaseBlocExampleScreenEventOnIncrement
    extends BaseBlocExampleScreenEvent {}
