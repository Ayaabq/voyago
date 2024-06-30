import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:voyago/core/utils/api.dart';
import 'package:voyago/feature/auth/register/data/repo/register_repo.dart';
import 'package:voyago/feature/auth/register/data/repo/register_repo_imp.dart';

final getIt = GetIt.instance;

void setUpServiceLocater() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<RegisterRepoImp>(RegisterRepoImp(getIt.get<Api>()));
}