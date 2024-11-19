# DMI-10A-YesNoAppChat-200995
Como parte de la asignatura de Desarrollo Móvil Integral (DMI), impartida por el M.T.I. Marco A. Ramírez Hernández.

---

## Índice
1. [Historial de Prácticas](#historial-de-prácticas)
2. [Lista de Herramientas](#lista-de-herramientas)
3. [Resumen del Proyecto](#resumen-del-proyecto)
4. [Justificación](#justificación)
5. [Objetivos](#objetivos)
6. [Desarrollo de la Aplicación](#desarrollo-de-la-aplicación)
7. [Conclusiones](#conclusiones)
8. [Autor](#autor)

---

### HISTORIAL DE PRÁCTICAS
| No. | Nombre                                  | Potenciador | Estatus |
|-----|-----------------------------------------|-------------|---------|
| 22  | Integración de Widgets y Funcionalidad  | 8           | ACTIVA  |
| 23  | Implementación de Respuesta Automática  | 8           | ACTIVA  |

---

### LISTA DE HERRAMIENTAS
![DART](https://img.shields.io/badge/Dart-0175c2?style=for-the-badge&logo=dart&logoColor=white)
![FLUTTER](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

## AUTOR
Elaborado por: Jesus Rios Gomez [@Jesus200995](https://github.com/Jesus200995)

<div align="center">

| ![Imagen 1](https://github.com/user-attachments/assets/1c6244e9-2a67-43ea-9734-663c8eccfff9) | ![Imagen 2](https://github.com/JonaIbarra/Recursos-Humanos/blob/America/Documentation/LOGO%20UNIVERSIDAD%201.jpeg) |
|:---:|:---:|


| **Nombre del estudiante** | Jesus Rios Gomez|
|:-------------------------:|:------------------------------:|
| **Matrícula**             | 200995                         |
| **Carrera**               | Ingeniería en Desarrollo y Gestión de Software |

</div>


---

## Resumen del Proyecto
**Yes/Not Chat** es una aplicación de chat desarrollada en Flutter para la asignatura de DMI. Permite al usuario explorar funcionalidades de mensajería y multimedia aplicando conceptos de desarrollo móvil.

- **Características**: 
  - Envío y recepción de mensajes de texto.
  - Respuesta automática a ciertas palabras clave.
  - Carga y visualización de imágenes y GIFs.
  - Registro de logs para facilitar la depuración y mejora continua.

---

## Justificación
Este proyecto permite a los estudiantes aplicar conocimientos sobre interfaces de usuario y comunicación en Flutter. Se diseñó para simular una aplicación de chat funcional, implementando lógica de respuesta automática y soporte multimedia para reforzar el aprendizaje práctico.

---

## Objetivos
### Objetivo General
Desarrollar una aplicación de chat en Flutter que permita enviar y recibir mensajes de texto, incluyendo funcionalidades de respuesta automática y soporte de multimedia.

### Objetivos Específicos
1. Implementar una interfaz de usuario intuitiva para la mensajería.
2. Configurar una lógica de respuesta automática a palabras clave.
3. Incluir soporte para visualización de imágenes y GIFs.
4. Registrar eventos en la aplicación con el paquete `logger` para facilitar la depuración.

---

## Desarrollo de la Aplicación
### Estructura de la Aplicación
- **Pantalla de Chat**: Permite enviar y recibir mensajes, con un campo de texto para entrada y un botón para enviar.
- **Lógica de Respuesta Automática**: Detecta palabras clave en los mensajes y responde automáticamente.
- **Soporte de Imágenes y GIFs**: Usa el paquete `cached_network_image` para optimizar la carga y visualización de multimedia.
- **Gestión de Logs**: Implementa `logger` para registrar eventos y facilitar el seguimiento de errores y mejoras.

### Código Destacado
Ejemplo de implementación de respuesta automática:
```dart
void handleMessage(String message) {
  if (message.contains("hello")) {
    sendMessage("Hello! How can I help you?");
  } else if (message.contains("bye")) {
    sendMessage("Goodbye! Have a great day!");
  }
  // Lógica adicional para detectar palabras clave y responder
}

![image](https://github.com/user-attachments/assets/ab06a4e6-83bc-4cc6-82ef-9817545ab4c6)
![image](https://github.com/user-attachments/assets/8cf97279-17ee-410f-860a-5af36b03008f)
