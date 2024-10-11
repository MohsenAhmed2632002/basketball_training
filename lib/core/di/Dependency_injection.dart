import 'package:basketball_training/core/NetWorking/api_service.dart';
import 'package:basketball_training/core/NetWorking/dio_factory.dart';
import 'package:basketball_training/features/Home/data/repositories/HomeRepo.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_cubit.dart';
import 'package:basketball_training/features/Login/presentation/cubit/login_cubit.dart';
import 'package:basketball_training/features/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:basketball_training/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:basketball_training/features/Login/data/repositories/loginRepo.dart';

final getIt = GetIt.instance;

Future<void> setupGitDI() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      getIt(),
    ),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt(),
    ),
  );
}
