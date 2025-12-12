abstract class AuthStates {
  AuthStates();
}
class InitAuthState extends AuthStates{}
class LoadingAuthState extends AuthStates{}
class SuccessAuthState extends AuthStates{}
class ErrorAuthState extends AuthStates{
  final String errorMsg;
  ErrorAuthState({required this.errorMsg});
}