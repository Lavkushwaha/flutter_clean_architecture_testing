import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/domain/usecase/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUsecase usecase;
  UserBloc(this.usecase) : super(UserInitialState()) {
    on<UserEvent>((event, emit) {});
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoadingState());
      final res = await usecase.execute();
      res.fold((l) => emit(UserErrorState(l.message.toString())), (r) => emit(UserLoadedState(r)));
    });
  }
}
