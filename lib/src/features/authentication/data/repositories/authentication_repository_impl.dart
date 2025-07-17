import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_user.dart';
import '../../domain/entities/sign_in_params.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_remote_data_source.dart';
import '../models/sign_in_params_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  const AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  ResultFuture<CoreUser?> signIn(SignInParams params) async {
    try {
      final requestModel = SignInParamsModel.fromEntity(params);
      final result = await _remoteDataSource.signIn(requestModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<CoreUser?> signInWithCredential() async {
    try {
      final result = await _remoteDataSource.signInWithCredential();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid signOut() async {
    try {
      final result = await _remoteDataSource.signOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
