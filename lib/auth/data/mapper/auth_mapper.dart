import 'package:ecommerce/auth/data/models/request/register_request_dm.dart';
import 'package:ecommerce/auth/data/models/response/auth_response_dm.dart';
import 'package:ecommerce/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthMapper {
  // userEntity to request
  // RegisterRequestDm entityToDto(UserEntity userInfo) {
  //   return RegisterRequestDm(
  //     name: userInfo.name,
  //     email: userInfo.email,
  //   );
  // }

  // request& response to userEntity
  UserEntity DtoToEntity(RegisterRequestDm userInfo) {
    return UserEntity(
      userInfo.name!,
      userInfo.email!,
    );
  }
}
