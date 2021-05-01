import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/model/user_model.dart';
import 'package:sentry_dio_error_app/pages/layout.dart';
import 'package:sentry_dio_error_app/pages/users/users_controller.dart';

class UsersPage extends StatefulWidget {
  static String tag = '/users';

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final controller = UsersController();

  @override
  void initState() {
    controller.getUsersList();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      StreamBuilder<List<UserModel>>(
        stream: controller.output,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];

              return Dismissible(
                key: Key('id-${user.id!}'),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Delete', style: TextStyle(color: Colors.white)),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(user.name!.characters.first),
                  ),
                  title: Text('#${user.id} - ${user.name!}'),
                  subtitle: Text(user.nickname!),
                  onTap: () {
                    print('${user.name!}');
                  },
                ),
                onDismissed: (direction) {
                  controller.deleteItem(user.id!).onError((error, stackTrace) {
                    print([error, stackTrace]);
                  });
                },
              );
            },
          );
        },
      ),
      title: 'Users List',
    );
  }
}
