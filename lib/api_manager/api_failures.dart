class ApiFailures{
  String errorMessage;
  ApiFailures({required this.errorMessage});

}
class ServerFailures extends ApiFailures{
  ServerFailures({required super.errorMessage});
}
class NetworkFailures extends ApiFailures{
  NetworkFailures({required super.errorMessage});
}
class UserFailures extends ApiFailures{
  UserFailures({required super.errorMessage});
}
