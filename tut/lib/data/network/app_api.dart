import 'package:ap/app/constants.dart';
import 'package:ap/data/response/responces.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthencationResponse> login(
      @Field("email") String email, @Field("password") String password);
}
