import 'package:equatable/equatable.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'No Internet Connection';
const String UNEXPECTED_FAILURE_MESSAGE = 'Unexpected error';

abstract class Failure extends Equatable {
  String get failureMessage => UNEXPECTED_FAILURE_MESSAGE;
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];

  @override
  String get failureMessage => SERVER_FAILURE_MESSAGE;
}

class ConnectionFailure extends Failure {
  @override
  List<Object?> get props => const <dynamic>[];

  @override
  String get failureMessage => CONNECTION_FAILURE_MESSAGE;
}
