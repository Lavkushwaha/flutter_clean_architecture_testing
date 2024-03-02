import 'package:json_placeholder_tdd2/src/core/exceptions/app_exceptions.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/data/model/user_model.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';

UserModel dummyUserModel = UserModel(postId: 1, id: 1, name: 'name', email: 'email', body: 'body');
UserEntity dummyUserEntity = UserEntity(postId: 1, id: 1, name: 'name', email: 'email', body: 'body');

List<UserModel> dummyUserModelList = [dummyUserModel];
List<UserEntity> dummyUserEntityList = [dummyUserEntity];

const dummyUserModelJson = '''{"postId":1,"id":1,"name":"name","email":"email","body":"body"}''';

const dummyListUserModelJson = '''[{"postId":1,"id":1,"name":"name","email":"email","body":"body"}]''';

// FAILURES
const String dummyErrorMessage = 'error message';
const ServerFailure dummyServerFailure = ServerFailure(dummyErrorMessage);
// EXCEPTIONS
ServerException dummyServerException = ServerException(dummyErrorMessage);
