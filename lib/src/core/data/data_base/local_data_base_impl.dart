import 'package:alex_k_test_cats_facts/src/futures/cat_facts/data/models/CatFacsModel.dart';
import 'package:alex_k_test_cats_facts/src/futures/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:hive/hive.dart';

import 'local_data_base.dart';

class LocalDataBaseImpl implements LocalDataBase {
  final BoxCollection boxCollection;

  LocalDataBaseImpl(this.boxCollection);

  @override
  Future<List<CatFactEntity>?> getAllSavedCatsFacts() async {
    final box = await _openDbBox();
    final catsFields = await box.getAllValues();
    return catsFields.values.map((e){
      return CatFactsModel.fromDbJson(e);
    }).cast<CatFactEntity>().toList();
  }

  @override
  Future<CatFactEntity> getLastSavedCatFact() async {
    final box = await _openDbBox();
    final catsFields = await box.getAllValues();
    return CatFactsModel.fromDbJson(catsFields.values.last);
  }

  @override
  Future<void> saveCatFactToDb(CatFactEntity catFactEntity) async {
    final box = await _openDbBox();
    box.put(catFactEntity.id, (catFactEntity as CatFactsModel).toJson());
  }

  Future<CollectionBox<Map>> _openDbBox() async {
    return await boxCollection.openBox<Map>('cats');
  }
}
