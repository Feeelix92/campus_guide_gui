import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/screens/news_screen.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../widgets/h1.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';

@RoutePage()
class MessageWriteScreen extends StatefulWidget {

  const MessageWriteScreen({super.key});

  @override
  State<MessageWriteScreen> createState() => _MessageWriteScreenState();
}

class _MessageWriteScreenState extends State<MessageWriteScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _textController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final message = Message();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
        body: Center(
          child: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const H1(text: 'Schreiben Sie einen Beitrag'),
                const SizedBox(height: 20),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Titel',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Text',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(
                    labelText: 'Autor',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String titel = _titleController.text;
                    String text = _textController.text;
                    String author = _authorController.text;

                    // Beispiel-Validierung: Überprüfen, ob alle Felder nicht leer sind
                    if (titel.isNotEmpty && text.isNotEmpty &&
                        author.isNotEmpty) {
                      message.postMessageData(titel, text, author, "", "", [""]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsScreen(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              title: const Text('Fehler'),
                              content: const Text(
                                  'Bitte füllen Sie alle Felder aus.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  child: const Text('Nachricht posten'),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_back),
      ),
      );
  }
}
