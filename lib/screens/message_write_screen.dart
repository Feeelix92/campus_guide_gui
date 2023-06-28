import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/app_router.gr.dart';
import '../core/message.dart';
import '../widgets/customErrorDialog.dart';
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
  final TextEditingController _teaserController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  List<String> _tags = [];
  final message = Message();

  @override
  void initState() {
    super.initState();
  }

  void _addTag(String tag) {
    // Nur nicht-leere Tags hinzufügen
    if (tag.isNotEmpty) {
      tag = tag.toLowerCase();
      setState(() {
        _tags.add(tag);
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenWidth-0.1*screenWidth,
              child: Column(
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
                    controller: _teaserController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Teaser',
                    ),
                  ),
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
                  TextField(
                    controller: _tagController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    ], // Only
                    decoration: InputDecoration(
                      labelText: 'Tag hinzufügen',
                      hintText: '...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _addTag(_tagController.text);
                          _tagController.clear();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: _tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        onDeleted: () => _removeTag(tag),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      String titel = _titleController.text;
                      String text = _textController.text;
                      String teaser = _teaserController.text;
                      String author = _authorController.text;

                      // Beispiel-Validierung: Überprüfen, ob alle Felder nicht leer sind
                      if (titel.isNotEmpty && text.isNotEmpty &&
                          author.isNotEmpty) {
                        message.postMessageData(titel, text, teaser, author, _tags);
                        AutoRouter.of(context).push(const MessageRoute());
                      } else {
                        customErrorDialog(context, 'Fehler', 'Bitte füllen Sie alle Felder aus.');
                      }
                    },
                    child: const Text('Nachricht posten'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const MessageRoute());
        },
        child: const Icon(Icons.arrow_back),
      ),
      );
  }
}
