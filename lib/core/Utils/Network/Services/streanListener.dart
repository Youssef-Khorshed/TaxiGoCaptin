import 'dart:async';

import 'package:flutter/material.dart';

class DataService<T> {
  final StreamController<T> controller = StreamController<T>.broadcast();
  final Future<T> Function() fetchData;
  final Duration pollingInterval;

  DataService({required this.fetchData, required this.pollingInterval});

  void startPolling() {
    if (controller.isClosed == false) {
      debugPrint('Stram is open');
      Timer.periodic(pollingInterval, (timer) async {
        T newData = await fetchData();
        controller.add(newData);
      });
    } else {
      debugPrint('Stram is Closed');
    }
  }

  Stream<T> get dataStream => controller.stream;

  void dispose() {
    controller.close();
    debugPrint('Stram is Closed');
  }
}

// Future<String> fetchStringData() async {
//   //await Future.delayed(const Duration(seconds: 3));
//   return 'Updated String data at ${DateTime.now()}';
// }

// void listenStrinigData() {
//   final stringService = DataService<String>(
//     fetchData: fetchStringData,
//     pollingInterval: const Duration(seconds: 1),
//   );
//   stringService.startPolling();
//   stringService.dataStream.listen((data) {
//     debugPrint('Received data: $data');
//   });
// }
