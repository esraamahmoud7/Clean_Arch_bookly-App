import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Home/data/Data Source/home_local_data_source_imp.dart';
import '../../Features/Home/data/Data Source/home_remote_data_source_imp.dart';
import '../../Features/Home/data/Repos/HomeReopImp.dart';
import '../../main.dart';
import 'APIServices.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<APIServices>(APIServices(dio: getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImp>(
      HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourceImp(getIt.get<APIServices>()),
      homeLocalDataSource: HomeLocalDataSourceImp()
  ));
}
