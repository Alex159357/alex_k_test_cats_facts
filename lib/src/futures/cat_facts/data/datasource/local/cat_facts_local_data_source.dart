

import '../../../domain/entities/cat_fact_entity.dart';

abstract  class CatFactsLocalDataSource{

  Future<CatFactEntity?> getLastCatFact();

  Future<List<CatFactEntity>?> getCatFactsHistory();

  Future<void> saveCatFactToDb(CatFactEntity catFactEntity);

}