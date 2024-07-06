import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/domain/services/api_imp.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo_impl.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo_imp.dart';
import 'package:voyago/feature/home/data/repo/desrination_repo_impl.dart';
import 'package:voyago/feature/home/data/repo/destination_repo.dart';

final getIt = GetIt.instance;

void setUpServiceLocater() {
  getIt.registerSingleton<ApiServices>(ApiServicesImp(Dio()));
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(getIt.get<ApiServices>()));
getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiServices>()));
}
