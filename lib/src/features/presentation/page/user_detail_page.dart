import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';

@RoutePage()
class UserDetailsPage extends StatefulWidget {
  final UserEntity userEntity;
  const UserDetailsPage({super.key, required this.userEntity});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.userEntity.name} Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.userEntity.email),
          Text(widget.userEntity.body),
        ],
      ),
    );
  }
}
