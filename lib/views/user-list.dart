import 'package:AP2DM/components/user-tile.dart';
import 'package:AP2DM/provider/users.dart';
import 'package:AP2DM/routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuários"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                {Navigator.of(context).pushNamed(AppRoutes.USER_FORM)},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) => UserTile(users.byIndex(index))),
    );
  }
}
