import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:music_app/services/queries/album_queries.dart';
import 'package:music_app/services/queries/artists_queries.dart';
import 'package:music_app/services/queries/auth_queries.dart';
import 'package:music_app/services/queries/track_queries.dart';
import 'package:music_app/services/responses/all_albums_response.dart';
import 'package:music_app/services/responses/all_artists_response.dart';
import 'package:music_app/services/responses/create_user_response.dart';
import 'package:music_app/services/responses/home_tracks_response.dart';
import 'package:music_app/services/responses/login_response.dart';
import 'package:music_app/utils/app_logger.dart';

import 'app_graphql_client.dart';

class ArtistService {
  static ArtistService _singleton = new ArtistService._internal();

  factory ArtistService() {
    return _singleton;
  }

  static ArtistService getInstance() {
    if (_singleton == null) {
      _singleton = new ArtistService._internal();
      return _singleton;
    }
    return _singleton;
  }

  ArtistService._internal();

  Future<AllArtistsResponse> getAllArtists() async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(ArtistQuery.allArtists),
    );

    final QueryResult result =
        await AppGraphQlClient.getClient().query(options);

    if (result.hasException) {
      throw Exception(
          result.exception.graphqlErrors.elementAt(0).extensions["exception"]
              ["data"]["message"][0]["messages"][0]["message"]);
    } else {
      print(result.data);
      return AllArtistsResponse.fromJson(result.data);
    }
  }
}
