import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:music_app/services/queries/album_queries.dart';
import 'package:music_app/services/queries/auth_queries.dart';
import 'package:music_app/services/queries/track_queries.dart';
import 'package:music_app/services/responses/all_albums_response.dart';
import 'package:music_app/services/responses/create_user_response.dart';
import 'package:music_app/services/responses/home_tracks_response.dart';
import 'package:music_app/services/responses/login_response.dart';
import 'package:music_app/utils/app_logger.dart';

import 'app_graphql_client.dart';

class AlbumService {
  static AlbumService _singleton = new AlbumService._internal();

  factory AlbumService() {
    return _singleton;
  }

  static AlbumService getInstance() {
    if (_singleton == null) {
      _singleton = new AlbumService._internal();
      return _singleton;
    }
    return _singleton;
  }

  AlbumService._internal();

  Future<AllAlbums> getAllAlbums() async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(AlbumQuery.allAlbums),
    );

    final QueryResult result =
        await AppGraphQlClient.getClient().query(options);

    if (result.hasException) {
      throw Exception(
          result.exception.graphqlErrors.elementAt(0).extensions["exception"]
              ["data"]["message"][0]["messages"][0]["message"]);
    } else {
      print(result.data);
      return AllAlbums.fromJson(result.data);
    }
  }
}
