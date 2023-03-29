import '../../../domain/entities/cat_fact_entity.dart';

abstract class CatsFactsRemoteDataSource{
  Future<CatFactEntity?> getCatFacts();
}