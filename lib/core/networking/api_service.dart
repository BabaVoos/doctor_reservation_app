import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_constants.dart';
import 'package:doctor_reservation_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_reservation_app/features/login/data/models/login_response.dart';
import 'package:doctor_reservation_app/features/signup/data/models/signup_request_body.dart';
import 'package:doctor_reservation_app/features/signup/data/models/signup_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl) // Retrofit annotation
abstract class ApiService {
  
  // Inject Dio in ApiService => Api Service constructor depend on Dio
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
