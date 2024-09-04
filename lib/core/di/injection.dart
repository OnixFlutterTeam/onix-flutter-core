import 'package:onix_flutter_core/core/di/app.dart';
import 'package:onix_flutter_core/core/di/bloc.dart';
import 'package:onix_flutter_core/core/di/local.dart';
import 'package:onix_flutter_core/core/di/remote.dart';
import 'package:onix_flutter_core/core/di/repository.dart';
import 'package:onix_flutter_core/core/di/services.dart';
import 'package:onix_flutter_core/core/di/source.dart';
import 'package:get_it/get_it.dart';

void initializeDi(GetIt getIt) {
  registerLocal(getIt);
  registerCoreServices(getIt);
  registerRemote(getIt);
  registerSources(getIt);
  registerRepositories(getIt);
  registerAppServices(getIt);
  registerApp(getIt);
  registerBloc(getIt);
}
