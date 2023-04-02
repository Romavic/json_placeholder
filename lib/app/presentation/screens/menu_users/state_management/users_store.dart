import 'package:json_placeholder/app/data/dto/response/user_response.dart';
import 'package:json_placeholder/app/domain/usecase/user_use_case.dart';
import 'package:mobx/mobx.dart';

part 'users_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserUseCase useCase;

  _UserStore({required this.useCase});

  List<UserResponse> listUser = List.of([]);

  @observable
  ObservableFuture<List<UserResponse>>? userFuture = ObservableFuture.value([]);

  @action
  Future fetchUser() {
   return userFuture = ObservableFuture();
  }
}
