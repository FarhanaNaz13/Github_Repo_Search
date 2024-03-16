import 'package:github_treasures/core/data/api_client/get_api.dart';
import 'package:github_treasures/core/data/api_client/request_date_time_genrator.dart';
import 'package:github_treasures/core/data/api_client/request_id_generator.dart';
import 'package:github_treasures/core/data/remote/authorizer.dart';
import 'package:github_treasures/core/dependency/injector.dart';
import 'package:github_treasures/core/exception/no_internet_exception_thrower.dart';
import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/core/network/connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CoreInjectionModule extends InjectoionModule {
  @override
  Future<void> inject({required Injector injector}) async {
    //api config
    /* -------------CORE----------------*/
    injector.registerFactory<Authorizer>(
      () => AuthorizerImpl(
        requestDateTimeStringGenerator: injector.get(),
        requestIdGenerator: injector.get(),
      ),
    );

    //generators
    injector.registerFactory<RequestIdGenerator>(
      () => RequestIdGeneratorImpl(
        uuid: injector.get(),
      ),
    );
    injector.registerFactory<RequestDateTimeStringGenerator>(
      () => RequestDateTimeStringGeneratorImpl(),
    );

    //api client

    injector.registerFactory<GetApi>(
      () => GetApiImpl(
        client: injector.get<http.Client>(),
        noInternetExceptionThrower: injector.get<NoInternetExceptionThrower>(),
      ),
    );

    // other
    injector.registerFactory<NoInternetExceptionThrower>(
      () => NoInternetExceptionThrowerImpl(
        ConnectionCheckerImpl(),
      ),
    );


    //3rd party
    injector.registerLazySingleton(
      () => http.Client(),
    );
    injector.registerLazySingleton(
      () => const Uuid(),
    );
    injector.registerFactory<PreAuthorizationHeader>(
      () => PreAuthorizationHeaderImpl(
        requestIdGenerator: injector.get(),
        requestDateTimeStringGenerator: injector.get(),
      ),
    );
    final sharedPreferences = await SharedPreferences.getInstance();
    injector.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );

    //local sources


    //repository


    //usecase

  }
}
