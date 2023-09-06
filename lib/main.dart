import 'package:app_hooks/state/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/Photo.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Note: MyApp is a HookConsumerWidget, from hooks_riverpod.
class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Photo>> photoData = ref.watch(photoStateFuture);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Example')),
          body: photoData.when(
              data: (photoData) {
                return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Image(
                        width: 200,
                        height: 200,
                        image: NetworkImage(
                            photoData[index].thumbnailUrl.toString()),
                      );
                    });
              },
              error: (error, Stack) => Center(
                    child: Text(error.toString()),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
