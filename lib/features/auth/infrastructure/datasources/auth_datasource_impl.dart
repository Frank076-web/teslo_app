import 'package:dio/dio.dart';
import 'package:teslo_app/config/config.dart';

import 'package:teslo_app/features/auth/domain/domain.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: Enviroment.apiUrl),
  );

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      final user = UserMapper.userApiV1ResponseToEntity(response.data);

      return user;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      throw CustomError();
    } catch (e) {
      throw CustomError();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      final user = UserMapper.userApiV1ResponseToEntity(response.data);

      return user;
    } on DioException catch (e) {
      //   print(e);
      if (e.response?.statusCode == 401) {
        throw WrongCredentials();
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      throw CustomError();
    } catch (e) {
      throw CustomError();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
