
import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:barbearia_jl_app/app/data/provider/auth_provider.dart';

import '../model/user_model.dart';

class AuthRepository {

final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String email,String password) async{
    Map json = await apiClient.login(email, password);
    return Auth.fromJson(json);
  }

  Future<User> register(String name,String email,String password) async{
    Map json = await apiClient.register(name,email,password);
    return User.fromJson(json['user']);
  }

}