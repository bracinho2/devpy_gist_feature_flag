import 'dart:convert';
import 'package:http/http.dart' as http;
import '../feature_flag/feature_flag.dart';
import '../gist_reference/gist_reference.dart';

class GistRemoteConfigClient {
  GistRemoteConfigClient._internal();

  factory GistRemoteConfigClient() => _instance;

  static final GistRemoteConfigClient _instance =
      GistRemoteConfigClient._internal();

  Future<FeatureFlag> getFeatureFromGist({
    required GistReference reference,
    required String feature,
  }) async {
    final response = await http.get(Uri.parse(_buildUrl(reference)));
    final jsonData = jsonDecode(response.body);
    return FeatureFlag.fromArray(jsonData, feature);
  }

  String _buildUrl(GistReference data) {
    return 'https://gist.githubusercontent.com/${data.owner}/${data.id}/raw/${data.file}';
  }
}
