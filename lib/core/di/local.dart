import 'package:onix_flutter_core/core/arch/data/local/prefs/base_preferences.dart';
// import 'package:onix_flutter_core/data/source/local/database/impl/todo_database_impl.dart';
// import 'package:onix_flutter_core/data/source/local/database/todo_database.dart';
// import 'package:onix_flutter_core/data/source/local/preferences_source/preferences_source.dart';
// import 'package:onix_flutter_core/data/source/local/preferences_source/preferences_source_impl.dart';
// import 'package:onix_flutter_core/data/source/local/secure_storage/secure_storage_source.dart';
// import 'package:onix_flutter_core/data/source/local/secure_storage/secure_storage_source_impl.dart';
import 'package:get_it/get_it.dart';

void registerLocal(GetIt getIt) {
  getIt
      //..registerLazySingleton<TodoDatabase>(TodoDatabaseImpl.new)
      .registerLazySingleton(BasePreferences.new);
  // ..registerLazySingleton<PreferencesSource>(
  //   () => PreferencesSourceImpl(getIt.get<BasePreferences>()),
  // )
  // ..registerLazySingleton<SecureStorageSource>(
  //   SecureStorageSourceImpl.new,
  // );
}
