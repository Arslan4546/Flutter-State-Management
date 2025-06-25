import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_riverpod_provider_practice/album_api.dart';

final apiProvider = Provider<AlbumApi>((ref) {
  return AlbumApi();
});

final futureProvider = FutureProvider<String>((ref) async {
  return ref.read(apiProvider).fetchData();
});
