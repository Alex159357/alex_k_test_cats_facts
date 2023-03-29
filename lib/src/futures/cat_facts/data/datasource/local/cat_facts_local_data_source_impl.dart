import '../../../../../core/error/exceptions.dart';
import '../../models/CatFacsModel.dart';
import '../../../domain/entities/cat_fact_entity.dart';
import 'package:hive/hive.dart';

import '../../../../../core/data/data_base/local_data_base.dart';
import 'cat_facts_local_data_source.dart';

class CatFactsLocalDataSourceImpl implements CatFactsLocalDataSource {
  final LocalDataBase localDataBase;

  CatFactsLocalDataSourceImpl(this.localDataBase);

  @override
  Future<List<CatFactEntity>?> getCatFactsHistory() async {
    List<CatFactEntity> catCatFactsList = [];
    try{
      return await localDataBase.getAllSavedCatsFacts();
    } on CacheException{
      // throw CacheException("");
    }
    return catCatFactsList;
  }

  @override
  Future<CatFactEntity?> getLastCatFact() async {
    try{
      return await localDataBase.getLastSavedCatFact();
    } catch(e){
      return null;
    }
  }

  @override
  Future<void> saveCatFactToDb(CatFactEntity catFactEntity) async {
    try{
      await localDataBase.saveCatFactToDb(catFactEntity);
    } on CacheException{
      throw CacheException("");
    }
  }
}
