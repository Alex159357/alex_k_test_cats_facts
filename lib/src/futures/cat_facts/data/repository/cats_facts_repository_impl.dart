import 'package:either_dart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failuers.dart';
import '../../../../core/network/info/network_info.dart';
import '../../domain/entities/cat_fact_entity.dart';
import '../../domain/repositories/cats_facts_repository.dart';
import '../datasource/local/cat_facts_local_data_source.dart';
import '../datasource/remote/cats_facts_remote_data_source.dart';

typedef _LoadCatFact = Future<CatFactEntity?> Function();

class CatsFactsRepositoryImpl implements CatsFactsRepository {
  final CatsFactsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final CatFactsLocalDataSource catFactsLocalDataSource;

  CatsFactsRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.catFactsLocalDataSource});

  @override
  Future<Either<Failures, CatFactEntity>> getCatFacts() async {
    return _getCatRandomFact(() => remoteDataSource.getCatFacts());
  }

  @override
  Future<Either<Failures, List<CatFactEntity>>> getCatFactsHistory() async {
    try {
      final catFactsHistoryList =
          await catFactsLocalDataSource.getCatFactsHistory();
      return catFactsHistoryList != null
          ? Right(catFactsHistoryList)
          : const Left(CacheFailure(""));
    } on CacheException {
      return const Left(CacheFailure(""));
    }
  }

  Future<Either<Failures, CatFactEntity>> _getCatRandomFact(
      _LoadCatFact getCaFact) async {
    bool connectionState = await networkInfo.getDidConnected;
    if (connectionState) {
      try {
        final remoteCatRandomFact = await getCaFact();
        if (remoteCatRandomFact != null) {
          await catFactsLocalDataSource.saveCatFactToDb(remoteCatRandomFact);
          return Right(remoteCatRandomFact);
        } else {
          return const Left(ServerFailure("Server error"));
        }
      } on ServerException {
        return const Left(ServerFailure("Server error"));
      }
    } else {
      try {
        CatFactEntity? lastLoadedCatFact =
            await catFactsLocalDataSource.getLastCatFact();
        return lastLoadedCatFact != null
            ? Right(lastLoadedCatFact!)
            : const Left(CacheFailure(""));
      } on CacheException {
        return const Left(CacheFailure(""));
      }
    }
  }
}
