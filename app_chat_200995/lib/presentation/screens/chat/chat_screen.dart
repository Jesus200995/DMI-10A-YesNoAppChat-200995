import 'package:flutter/material.dart';
import 'package:app_chat_200995/presentation/widgets/chat/her_message_bubble.dart';
import 'package:app_chat_200995/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_chat_200995/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  // Lista de mensajes simulados
  List<String> messages = [
    'Hola, ¿cómo estás?',
    'Todo bien, ¿y tú?',
    'Aquí todo bien, gracias por preguntar!',
  ];

  void addMessage(String message) {
    setState(() {
      messages.add(message);  // Añade un nuevo mensaje
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // URL válida para la imagen de perfil
          ),
        ),
        title: const Text('Mi amor ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(
        messages: messages,  // Pasa la lista de mensajes a _ChatView
        onMessageSent: addMessage, // Pasa el método para agregar mensajes
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  final List<String> messages;
  final Function(String) onMessageSent;

  const _ChatView({required this.messages, required this.onMessageSent});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return index % 2 == 0
                          ? HerMessageBubble(message: message)  // Mensaje de "ella"
                          : MyMessageBubble(message: message);  // Mensaje de "yo"
                    }
                ),
            ),

            /// Caja de texto de mensajes
            MessageFieldBox(
              onMessageSent: onMessageSent,  // Proporciona la función para enviar mensajes
            ),
          ],
        ),
      ),
    );
  }
}
