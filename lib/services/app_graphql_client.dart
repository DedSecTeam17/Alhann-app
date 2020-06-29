import 'package:graphql/client.dart';

class AppGraphQlClient {
  static GraphQLClient getClient({String token}) {
    final HttpLink httpLink = HttpLink(
      uri: 'http://10.0.2.2:1337/graphql',
    );
    if (token != null) {
      final AuthLink _authLink = AuthLink(
        getToken: () async => 'Bearer $token',
      );
      final Link _link = _authLink.concat(httpLink);
      return GraphQLClient(
        cache: InMemoryCache(),
        link: _link,
      );
    } else {
      return GraphQLClient(
        cache: InMemoryCache(),
        link: httpLink,
      );
    }
  }
}
