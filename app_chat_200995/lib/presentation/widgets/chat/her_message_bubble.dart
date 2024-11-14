import 'package:flutter/material.dart';
import 'package:app_chat_200995/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Container(colors: colors, message: message),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(image: message.imageUrl!),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _Container extends StatelessWidget { 
  const _Container({
    required this.colors,
    required this.message,
  });

  final ColorScheme colors;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // nos da info del dispositivo, dimensiones y caracteristicas

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              child: const Text('JessChat está enviando una imagen'),
            );
          },
        ));
  }
}

///
///Forma de construccion en tiempo de ejecucion de la app
///
