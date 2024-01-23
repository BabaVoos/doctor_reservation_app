import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_service.dart';
import 'package:doctor_reservation_app/core/networking/dio_factory.dart';
import 'package:doctor_reservation_app/features/login/data/repos/login_repo.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/signup/data/repos/signup_repo.dart';
import 'package:doctor_reservation_app/features/signup/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt())); // lazy means it will not create a new instance when needed and will be used across your entire app
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt())); // factory means every time i call it it will create a new instance
}
