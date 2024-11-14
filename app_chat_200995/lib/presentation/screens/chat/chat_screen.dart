import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_chat_200995/domain/entities/message.dart';
import 'package:app_chat_200995/presentation/providers/chat_provider.dart';
import 'package:app_chat_200995/presentation/widgets/chat/her_message_bubble.dart';
import 'package:app_chat_200995/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_chat_200995/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarView(),
      body: _ChatView(),
    );
  }
}

class _AppBarView extends AppBar {
  _AppBarView()
      : super(
          leading: const Padding(
            // Espacio antes del titulo
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/e2/7c/72/e27c72cfb5c3c8f4c873a649f88ea540.jpg'),
            ),
          ),
          title: const Text('JessChat'),
          centerTitle: false,
        );
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // SafeArea: Desplegar contenido en el cuerpo del dispositivo evita poner widgets en zonas reservadas del dispositivo
      child: Padding(
        // Crear Padding
        padding: const EdgeInsets.symmetric(
            horizontal: 10), // Asignar padding a los lados de igual config
        child: Column(
          // Columna iterar widgets hacia abajo
          children: [
            Expanded(
              // expandir widget a mayor cantidad del dispositivo
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider
                    .messageList.length, // Cantidad de items a desplegar
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message,)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ), // builder solo crea en el UI los elementos a mostrar
            ),

            /// Caja de texto de mensajes
            MessageFieldBox(
                // onValue: (value) => chatProvider.sendMessage(value),
                onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
