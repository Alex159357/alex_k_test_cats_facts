import 'dart:io';

import 'package:alex_k_test_cats_facts/src/core/data/data_base/local_data_base_impl.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../config/constaints/network_constaints.dart';
import '../core/data/client/api_client.dart';
import '../core/data/client/dio_client.dart';
import '../core/data/data_base/local_data_base.dart';
import '../core/network/info/network_info.dart';
import '../core/network/info/network_info_impl.dart';
import '../futures/cat_facts/data/datasource/local/cat_facts_local_data_source.dart';
import '../futures/cat_facts/data/datasource/local/cat_facts_local_data_source_impl.dart';
import '../futures/cat_facts/data/datasource/remote/cats_facts_remote_data_source.dart';
import '../futures/cat_facts/data/datasource/remote/cats_facts_remote_data_source_impl.dart';
import '../futures/cat_facts/data/repository/cats_facts_repository_impl.dart';
import '../futures/cat_facts/domain/repositories/cats_facts_repository.dart';
import '../futures/cat_facts/domain/usecase/get_cat_facts_history_usecase.dart';
import '../futures/cat_facts/domain/usecase/get_cat_facts_use_case.dart';
import '../futures/cat_facts/presentation/blocs/cat_cubit_navigation/cat_bloc_navigation_cubit.dart';
import '../futures/cat_facts/presentation/blocs/cats_fact_blocs/cats_fact_blocs_bloc.dart';

late GetIt getIt;

class InjectionContainer {
  static Future<void> initDi() async {
    getIt = GetIt.instance;
    //usecase
    getIt.registerLazySingleton(() => GetCatFactsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetCatFactsHistoryUseCase(getIt()));
    // repository
    getIt.registerLazySingleton<CatsFactsRepository>(() =>
        CatsFactsRepositoryImpl(
            remoteDataSource: getIt(),
            networkInfo: getIt(),
            catFactsLocalDataSource: getIt()));
    // Data sources
    getIt.registerLazySingleton<CatsFactsRemoteDataSource>(
        () => CatsFactsRemoteDataSourceImpl(getIt()));
    getIt.registerLazySingleton<CatFactsLocalDataSource>(
        () => CatFactsLocalDataSourceImpl(getIt()));
    //client
    getIt.registerLazySingleton(() => DioClient(BASE_URL));
    //network info
    getIt.registerLazySingleton(() => ApiClient(getIt.get<DioClient>().dio));
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    getIt.registerLazySingleton(() => DataConnectionChecker());
    //db
    final collection = await initDb();
    getIt.registerLazySingleton<BoxCollection>(() => collection);
    getIt
        .registerLazySingleton<LocalDataBase>(() => LocalDataBaseImpl(getIt()));
    //blocs / cubit
    getIt.registerLazySingleton<CatsFactBlocs>(() => CatsFactBlocs(
        getCatFactsUseCase: getIt(), getCatFactsHistoryUseCase: getIt()));
    getIt.registerLazySingleton<CatBlocNavigationCubit>(
        () => CatBlocNavigationCubit());
  }

  static Future<BoxCollection> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();

    return BoxCollection.open(
      'appLocalDataBase',
      {'cats'},
      path: directory.path,
    );
  }
}
