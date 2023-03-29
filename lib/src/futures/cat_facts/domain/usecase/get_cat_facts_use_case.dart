import 'package:alex_k_test_cats_facts/src/core/error/failuers.dart';
import 'package:either_dart/src/either.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_fact_entity.dart';
import '../repositories/cats_facts_repository.dart';

class GetCatFactsUseCase implements UseCase<CatFactEntity, NoParams> {
  final CatsFactsRepository repository;

  GetCatFactsUseCase(this.repository);

  @override
  Future<Either<Failures, CatFactEntity>> call(NoParams params) => repository.getCatFacts();
}


