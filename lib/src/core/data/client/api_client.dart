import 'package:alex_k_test_cats_facts/src/futures/cat_facts/data/models/CatFacsModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../config/constaints/network_constaints.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/facts/random')
  Future<CatFactsModel?> getFact();
}
