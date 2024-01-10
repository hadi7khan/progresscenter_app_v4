import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/datasource/accounts_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/models/accounts_model.dart';
import 'package:progresscenter_app_v4/src/feature/account/domain/accounts_repository.dart';

final accountsProvider = Provider.autoDispose<AccountsRepositoryImpl>(
  (ref) {
    return AccountsRepositoryImpl(
        accountsDataSource: ref.watch(accountsDataSourceProvider));
  },
);

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsDataSource accountsDataSource;
  AccountsRepositoryImpl({
    required this.accountsDataSource,
  });

  @override
  Future<Either<Failure, AccountsModel>> getProfile() async {
    try {
      final result = await accountsDataSource.getProfile();
      return Right((AccountsModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
