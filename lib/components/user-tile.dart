import 'package:AP2DM/models/user.dart';
import 'package:AP2DM/provider/users.dart';
import 'package:AP2DM/routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(child: Icon(Icons.person));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                }),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  Provider.of<Users>(context, listen: false).remove(user);
                }),
          ],
        ),
      ),
    );
  }
}
