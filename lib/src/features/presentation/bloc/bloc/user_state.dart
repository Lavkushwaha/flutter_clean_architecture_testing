part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserEntity> userEntityList;
  const UserLoadedState(this.userEntityList);
}

class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);
}
