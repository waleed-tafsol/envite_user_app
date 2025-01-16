// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:get/get.dart';

// class WebSocketService extends GetxService {
//   late WebSocketChannel channel;

//   RxBool isConnected = false.obs;
//   RxBool isGameStarted = false.obs;
//   RxBool isMyTurn = false.obs;

//   void connectToServer(String url) {
//     channel = WebSocketChannel.connect(Uri.parse(url));
//     isConnected.value = true;

//     channel.stream.listen((message) {
//       _handleMessage(message);
//     });
//   }

//   void sendMessage(String message) {
//     if (isConnected.value) {
//       channel.sink.add(message);
//     }
//   }

//   void _handleMessage(String message) {
//     if (message == 'start_game') {
//       isGameStarted.value = true;
//     } else if (message == 'your_turn') {
//       isMyTurn.value = true;
//     }
//   }

//   @override
//   void onClose() {
//     channel.sink.close();
//     super.onClose();
//   }
// }
