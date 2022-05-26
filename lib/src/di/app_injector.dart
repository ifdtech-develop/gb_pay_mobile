import 'package:gb_pay_mobile/src/data/data_source/local/local_data_source.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_data_source.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_postagem_data_source.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/domain/repository/postagem_repository.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';
import 'package:gb_pay_mobile/src/domain/use_case/create_user_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/dadosusuario_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/device_user_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/mostrarfeed_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/realizarpostagem_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/signin_user_use_case.dart';
import 'package:gb_pay_mobile/src/infra/data/data_source/local/app_local_data_source.dart';
import 'package:gb_pay_mobile/src/infra/data/data_source/remote/app_postagem_remote_data_source.dart';
import 'package:gb_pay_mobile/src/infra/data/data_source/remote/app_remote_data_source.dart';
import 'package:gb_pay_mobile/src/infra/domain/repository/app_postagem_repository.dart';
import 'package:gb_pay_mobile/src/infra/domain/repository/app_user_repository.dart';
import 'package:gb_pay_mobile/src/service/local_storage_service.dart';
import 'package:gb_pay_mobile/src/features/feed/feed_cubit.dart';
import 'package:gb_pay_mobile/src/features/signin/signin_cubit.dart';
import 'package:gb_pay_mobile/src/features/signup/signup_cubit.dart';
import 'package:gb_pay_mobile/src/features/splash/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class AppInjector implements Injector {
  @override
  void injection(GetIt injector) {
    injector
      ..registerSingleton<LocalStorageService>(
        LocalStorage(
          GetStorage(),
        ),
      )
      ..registerFactory<RemoteDataSource>(
        () => AppRemoteDataSource(
          storage: injector.get(),
        ),
      )
      ..registerFactory<RemotePostagemDataSource>(
        () => AppPostagemRemoteDataSource(
          storage: injector.get(),
        ),
      )
      ..registerFactory<LocalDataSource>(
        () => AppLocalDataSource(
          storage: injector.get(),
        ),
      )
      ..registerFactory<UserRepository>(
        () => AppUserRepository(
          dataSource: injector.get(),
          ldataSource: injector.get(),
        ),
      )
      ..registerFactory<PostagemRepository>(
        () => AppPostagemRepository(
          dataSource: injector.get(),
        ),
      )
      ..registerFactory<SigninUserUseCase>(
        () => SigninUser(
          repository: injector.get(),
        ),
      )
      ..registerFactory<DadosUsuarioUseCase>(
        () => DadosUsuario(
          repository: injector.get(),
        ),
      )
      ..registerFactory<DeviceUserUseCase>(
        () => DeviceUser(
          repository: injector.get(),
        ),
      )
      ..registerFactory<CreateUserUseCase>(
        () => CreateUser(
          repository: injector.get(),
        ),
      )
      ..registerFactory<MostrarFeedUseCase>(
        () => MostrarFeed(
          repository: injector.get(),
        ),
      )
      ..registerFactory<RealizarPostagemUseCase>(
        () => RealizarPostagem(
          repository: injector.get(),
        ),
      )
      ..registerFactory<SplashCubit>(
        () => SplashCubit(
          injector.get(),
        ),
      )
      ..registerFactory<SigninCubit>(
        () => SigninCubit(
          injector.get(),
          injector.get(),
        ),
      )
      ..registerFactory<SignupCubit>(
        () => SignupCubit(
          injector.get(),
        ),
      )
      ..registerFactory<FeedCubit>(
        () => FeedCubit(injector.get(), injector.get()),
      );
  }
}
