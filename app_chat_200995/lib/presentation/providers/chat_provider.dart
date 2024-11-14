import 'package:flutter/material.dart';
import 'package:app_chat_200995/config/helpers/get_yes_no_answer.dart';
import 'package:app_chat_200995/domain/entities/message.dart';

// ChangeNotifier Puede notificar si hay cambios

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola, ten un exelente dia Jess!', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    /// Notificar a los que estan escuchando que se actualizo la info
    ///

    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);

    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(
        milliseconds:
            100)); // darle tiempo a flutter tener el cambio para hacer scroll

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
