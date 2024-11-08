import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final Function(String) onMessageSent; // Parámetro para enviar mensajes

  const MessageFieldBox({super.key, required this.onMessageSent});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isNotEmpty) {
            onMessageSent(textValue);  // Llamar a onMessageSent para agregar el mensaje
            textController.clear();
          }
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          onMessageSent(value);  // Llamar a onMessageSent cuando se presione Enter
          textController.clear();
          focusNode.requestFocus();
        }
      },
    );
  }
}
