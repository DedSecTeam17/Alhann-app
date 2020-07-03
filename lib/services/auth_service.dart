import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:music_app/services/queries/auth_queries.dart';
import 'package:music_app/services/responses/create_user_response.dart';
import 'package:music_app/services/responses/login_response.dart';
import 'package:music_app/utils/app_logger.dart';

import 'app_graphql_client.dart';

class AuthService {
  static AuthService _singleton = new AuthService._internal();

  factory AuthService() {
    return _singleton;
  }

  static AuthService getInstance() {
    if (_singleton == null) {
      _singleton = new AuthService._internal();
      return _singleton;
    }
    return _singleton;
  }

  AuthService._internal();

  Future<SignUpResponse> createUser(
      {@required userName,
      @required String password,
      @required String email}) async {
    print("create a user");
    final MutationOptions options = MutationOptions(
      documentNode: gql(AuthQuery.createUser),
      variables: <String, dynamic>{
        'username': userName,
        'email': email,
        'password': password,
      },
    );

    final QueryResult result =
        await AppGraphQlClient.getClient().mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.graphqlErrors.elementAt(0).extensions["exception"]["data"]["message"][0]["messages"][0]["message"]);
    } else {
      return SignUpResponse.fromJson(result.data);
    }
  }

  Future<SignInResponse> login({
    @required identifier,
    @required String password,
  }) async {
    print("create a user");
    final MutationOptions options = MutationOptions(
      documentNode: gql(AuthQuery.login),
      variables: <String, dynamic>{
        'identifier': identifier,
        'password': password,
      },
    );

    final QueryResult result =
        await AppGraphQlClient.getClient().mutate(options);
    if (result.hasException) {
      throw Exception(result.exception.graphqlErrors.elementAt(0).extensions["exception"]["data"]["message"][0]["messages"][0]["message"]);
    } else {
      print(result.data);
      return SignInResponse.fromJson(result.data);
    }
  }
}
