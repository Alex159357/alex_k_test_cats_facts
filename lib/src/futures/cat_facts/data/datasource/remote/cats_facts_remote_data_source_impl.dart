

import '../../../../../core/error/exceptions.dart';
import '../../../domain/entities/cat_fact_entity.dart';
import '../../../../../core/data/client/api_client.dart';
import 'cats_facts_remote_data_source.dart';

class CatsFactsRemoteDataSourceImpl implements CatsFactsRemoteDataSource{
  final ApiClient _apiClient;
  CatsFactsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<CatFactEntity?> getCatFacts() async {
    try{
      CatFactEntity? res;
      res = await _apiClient.getFact();
      return res;
    } catch(e){
      throw ServerException("");
    }
  }
}

