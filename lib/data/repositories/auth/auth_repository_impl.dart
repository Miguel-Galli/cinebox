import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSigninService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSigninService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();
    return switch (resultToken) {
      Success<String?>() => Success(true),
      Failure<String?>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        //Vamos fazer o login do nosso back
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Error ao realizar login vom o google',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          DataException(message: 'Error ao realizar login com a Google'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.deleteIdToken();

        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log("Erro ao realizar logout ID token");
            return Failure(error);
        }

      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
