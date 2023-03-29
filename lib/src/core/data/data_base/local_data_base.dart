

import '../../../futures/cat_facts/domain/entities/cat_fact_entity.dart';

abstract class LocalDataBase{
  Future<CatFactEntity> getLastSavedCatFact();
  Future<List<CatFactEntity>?> getAllSavedCatsFacts();
  Future<void> saveCatFactToDb(CatFactEntity catFactEntity);
}