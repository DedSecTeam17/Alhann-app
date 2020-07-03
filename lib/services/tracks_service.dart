import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:music_app/services/queries/auth_queries.dart';
import 'package:music_app/services/queries/track_queries.dart';
import 'package:music_app/services/responses/create_user_response.dart';
import 'package:music_app/services/responses/home_tracks_response.dart';
import 'package:music_app/services/responses/login_response.dart';
import 'package:music_app/utils/app_logger.dart';

import 'app_graphql_client.dart';

class TrackService {
  static TrackService _singleton = new TrackService._internal();

  factory TrackService() {
    return _singleton;
  }

  static TrackService getInstance() {
    if (_singleton == null) {
      _singleton = new TrackService._internal();
      return _singleton;
    }
    return _singleton;
  }

  TrackService._internal();

  Future<HomeTracks> getHomeTracks(Type type) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(type == Type.FEATURED
          ? TrackQuery.featuredTracks
          : TrackQuery.topTracks),
    );

    final QueryResult result =
        await AppGraphQlClient.getClient().query(options);

    if (result.hasException) {
      throw Exception(
          result.exception.graphqlErrors.elementAt(0).extensions["exception"]
              ["data"]["message"][0]["messages"][0]["message"]);
    } else {
      print(result.data);
      return HomeTracks.fromJson(result.data, type);
    }
  }
}
