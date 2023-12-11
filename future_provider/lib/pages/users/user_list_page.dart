import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/user_detail_page.dart';
import 'package:future_provider/pages/users/users_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    print(userList);
    print(
        'isLoading: ${userList.isLoading}, isRefreshing: ${userList.isRefreshing},isReloading: ${userList.isReloading}');
    print('hasValue: ${userList.hasValue}, hasError: ${userList.hasError}');
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.invalidate(userListProvider);
              },
            )
          ],
        ),
        body: userList.when(
          skipLoadingOnRefresh: false,
          data: (users) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(userListProvider);
              },
              color: Colors.red,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserDetailPage(userId: user.id),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(user.id.toString()),
                      ),
                      title: Text(user.name),
                    ),
                  );
                },
              ),
            );
          },
          error: (e, st) {
            return Center(
              child:
                  Text(e.toString(), style: const TextStyle(color: Colors.red)),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
