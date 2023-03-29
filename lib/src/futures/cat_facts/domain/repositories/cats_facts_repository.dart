import 'package:either_dart/either.dart';
import '../../../../core/error/failuers.dart';
import '../entities/cat_fact_entity.dart';

abstract class CatsFactsRepository {
  Future<Either<Failures, CatFactEntity>> getCatFacts();

  Future<Either<Failures, List<CatFactEntity>>> getCatFactsHistory();
}
