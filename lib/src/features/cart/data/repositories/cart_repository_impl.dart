import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_cart.dart';
import '../../domain/entities/core_cart_params.dart';
import '../../domain/entities/core_product.dart';
import '../../domain/entities/core_seller.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';
import '../models/core_cart_params_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  const CartRepositoryImpl({
    required CartRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  ResultFuture<List<CoreProduct>> getAllProduct() async {
    try {
      final result = await _remoteDataSource.getAllProduct();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CoreSeller>> getAllSeller() async {
    try {
      final result = await _remoteDataSource.getAllSeller();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Position> getCurrentPosition() async {
    try {
      final result = await _remoteDataSource.getCurrentPosition();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CoreProduct>> getAllProductBySeller(String sellerId) async {
    try {
      final result = await _remoteDataSource.getAllProductBySeller(sellerId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<CoreCart> postItemToCart(CoreCartParams params) async {
    try {
      final paramsModel = CoreCartParamsModel.fromEntity(params);
      final result = await _remoteDataSource.postItemToCart(paramsModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
