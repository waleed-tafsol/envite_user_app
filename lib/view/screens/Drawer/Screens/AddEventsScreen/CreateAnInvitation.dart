import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';

// ignore: must_be_immutable
class CreateAnInvitationScreen extends StatelessWidget {
  CreateAnInvitationScreen({super.key});
  static const routeName = "CreateAnInvitationScreen";

  // final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // QuillSimpleToolbar(
          //   controller: _controller,
          //   configurations: const QuillSimpleToolbarConfigurations(),
          // ),
          // Expanded(
          //   child: QuillEditor.basic(
          //     controller: _controller,
          //     configurations: const QuillEditorConfigurations(),
          //   ),
          // )
        ],
      ),
    );
  }
}
