import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_placeholder/app/data/datasource/user_data_source.dart';
import 'package:json_placeholder/app/data/datasource/user_data_source_impl.dart';
import 'package:json_placeholder/app/data/remote/api/api.dart';
import 'package:json_placeholder/app/data/remote/api/api_impl.dart';
import 'package:json_placeholder/app/data/remote/interceptors/interceptor.dart';
import 'package:json_placeholder/app/data/repository/user_repository_impl.dart';
import 'package:json_placeholder/app/domain/repository/user_repository.dart';
import 'package:json_placeholder/app/domain/usecase/user_use_case.dart';
import 'package:json_placeholder/app/presentation/routes/name_routes.dart';
import 'package:json_placeholder/app/presentation/screens/menu_users/menu_users_screen.dart';
import 'package:json_placeholder/app/presentation/screens/menu_users/state_management/users_store.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton(
        (i) => Dio(
          BaseOptions(
            baseUrl: "https://jsonplaceholder.typicode.com/",
            connectTimeout: const Duration(seconds: 6),
            receiveTimeout: const Duration(seconds: 6),
            sendTimeout: const Duration(seconds: 6),
          ),
        )..interceptors.add(CustomInterceptors()),
      ),
      Bind.factory<Api>(
        (i) => ApiImpl(dio: i.get()),
      ),
      Bind.factory<UserDataSource>(
        (i) => UserDataSourceImpl(api: i.get()),
      ),
      Bind.factory<UserRepository>(
        (i) => UserRepositoryImpl(dataSource: i.get()),
      ),
      Bind.factory(
        (i) => UserUseCase(useCase: i.get()),
      ),
      Bind.lazySingleton(
        (i) => UserStore(useCase: i.get()),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        initialRoute,
        child: (context, args) => const MenuUsersScreen(),
      ),
    ];
  }
}
