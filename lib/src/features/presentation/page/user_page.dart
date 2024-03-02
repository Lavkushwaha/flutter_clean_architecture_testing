import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/bloc/bloc/user_bloc.dart';
import 'package:json_placeholder_tdd2/src/router/app_router.dart';

@RoutePage()
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getIt<UserBloc>().add(GetUsersEvent());
          context.read<UserBloc>().add(GetUsersEvent());
        },
        child: const Icon(Icons.refresh),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserInitialState) {
            return const Center(
              key: Key('userInitialKey'),
              child: Text("Nothing Here"),
            );
          } else if (state is UserLoadingState) {
            return const Center(
              key: Key('userLoadingKey'),
              child: CircularProgressIndicator(),
            );
          } else if (state is UserErrorState) {
            return Center(
              key: const Key('userErrorKey'),
              child: Text(state.errorMessage.toString()),
            );
          } else if (state is UserLoadedState) {
            return ListView.builder(
              key: const Key('userLoadedDataKey'),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    AutoRouter.of(context).push(UserDetailsRoute(userEntity: state.userEntityList[index]));
                  },
                  title: Text(state.userEntityList[index].name),
                  subtitle: Text(state.userEntityList[index].email),
                );
              },
              itemCount: state.userEntityList.length,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
