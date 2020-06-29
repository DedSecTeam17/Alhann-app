import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:music_app/services/queries/auth_queries.dart';

import 'app_graphql_client.dart';

class AuthService {
  static Future<void> createUser(
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
      print(result.exception.toString());
      return;
    }

    print(result.data.toString());
  }

  static Future<void> login({
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
      print(result.exception.toString());
      return;
    }

    print(result.data.toString());
  }
}
