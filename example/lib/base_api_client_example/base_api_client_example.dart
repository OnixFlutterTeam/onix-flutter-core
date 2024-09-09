import 'package:example/base_api_client_example/domain/entity/user_entity.dart';
import 'package:example/base_api_client_example/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseApiClientExample extends StatelessWidget {
  final String title;

  const BaseApiClientExample({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final data = snapshot.data;

              if (data == null || data.isEmpty) {
                return const Text('No data');
              }

              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final user = data[index];

                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<UserEntity>?> _getUsers() async {
    final result = await GetIt.I.get<UserRepository>().getUsers();

    if (result.success) {
      return result.data;
    }

    return null;
  }
}
