import '../../../../core/error/failuers.dart';
import 'package:either_dart/src/either.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_fact_entity.dart';
import '../repositories/cats_facts_repository.dart';

class GetCatFactsHistoryUseCase implements UseCase<List<CatFactEntity>, NoParams> {
  final CatsFactsRepository repository;

  GetCatFactsHistoryUseCase(this.repository);

  @override
  Future<Either<Failures, List<CatFactEntity>>> call(NoParams params) => repository.getCatFactsHistory();
}
