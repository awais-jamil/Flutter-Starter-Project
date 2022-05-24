import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  //
  // @POST('/endpointHere')
  // Future<ResponseModel> someApi(@Body() RequestModel request);
}
