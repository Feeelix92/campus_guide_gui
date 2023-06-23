import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

@RoutePage()
class MessageEditScreen extends StatefulWidget {
  const MessageEditScreen({super.key, @PathParam('id') required this.id});
  final String id;

  @override
  State<MessageEditScreen> createState() => _MessageEditScreenState();
}

class _MessageEditScreenState extends State<MessageEditScreen> {
  bool finish = false;

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _textController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  late Future<MessageData?> messageData;

  @override
  void initState() {
    super.initState();

    getNews();
  }

  final message = Message();

  getNews() {
    final profile = Message();
    messageData = profile.getMessageData(widget.id);
    setState(() {
      finish = true;
      _titleController.text ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            if (finish) ...[
              FutureBuilder(
                  future: messageData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _titleController.text = snapshot.data!.title!;
                      _textController.text = snapshot.data!.text!;
                      _authorController.text = snapshot.data!.author!;
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const H1(text: 'Bearbeiten Sie ihren Beitrag'),
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
                                  labelText: 'author',
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  String titel = _titleController.text;
                                  String text = _textController.text;
                                  String author = _authorController.text;

                                  // Beispiel-Validierung: Überprüfen, ob alle Felder nicht leer sind
                                  if (titel.isNotEmpty &&
                                      text.isNotEmpty &&
                                      author.isNotEmpty) {
                                    message.putMessageData(
                                        snapshot.data!.id! ,titel, text, author, ["cool", "nice"]);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
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
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            ] else ...[
              const CircularProgressIndicator()
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
