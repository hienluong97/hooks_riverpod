import 'package:app_hooks/network/network_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/Photo.dart';

final photoStateFuture = FutureProvider<List<Photo>>((ref) async {
  return fetchPhotos();
});
