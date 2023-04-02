import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_placeholder/app/presentation/screens/menu_users/state_management/users_store.dart';
import 'package:mobx/mobx.dart';

class MenuUsersScreen extends StatefulWidget {
  const MenuUsersScreen({Key? key}) : super(key: key);

  @override
  State<MenuUsersScreen> createState() => _MenuUsersScreenState();
}

class _MenuUsersScreenState extends State<MenuUsersScreen> {
  final store = Modular.get<UserStore>();

  @override
  void initState() {
    store.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        switch (store.userFuture!.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return Center(
              child: Text("Error"),
            );
          case FutureStatus.fulfilled:
            return Center(
              child: Text("Consegui"),
            );
        }
      }),
    );
  }
}
