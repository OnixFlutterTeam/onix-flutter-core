// import 'package:onix_flutter_core/data/repository/time_repository_impl.dart';
// import 'package:onix_flutter_core/data/repository/todo_repository_impl.dart';
// import 'package:onix_flutter_core/data/repository/token_repository_impl.dart';
// import 'package:onix_flutter_core/data/source/local/database/todo_database.dart';
// import 'package:onix_flutter_core/data/source/local/preferences_source/preferences_source.dart';
// import 'package:onix_flutter_core/data/source/local/secure_storage/secure_storage_source.dart';
// import 'package:onix_flutter_core/data/source/remote/time/time_source.dart';
// import 'package:onix_flutter_core/data/source/remote/todo/todo_source.dart';
// import 'package:onix_flutter_core/domain/repository/time_repository.dart';
// import 'package:onix_flutter_core/domain/repository/todo_repository.dart';
// import 'package:onix_flutter_core/domain/repository/token_repository.dart';
import 'package:get_it/get_it.dart';

void registerRepositories(GetIt getIt) {
  // getIt
  //   ..registerLazySingleton<TodoRepository>(
  //     () => TodoRepositoryImpl(
  //       getIt<TodoSource>(),
  //       getIt<TodoDatabase>(),
  //       getIt<PreferencesSource>(),
  //     ),
  //   )
  //   ..registerLazySingleton<TimeRepository>(
  //     () => TimeRepositoryImpl(getIt<TimeSource>()),
  //   )
  //   ..registerLazySingleton<TokenRepository>(
  //     () => TokenRepositoryImpl(getIt<SecureStorageSource>()),
  //   );
}
