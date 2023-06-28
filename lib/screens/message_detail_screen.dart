import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/customText.dart';
import '../widgets/h1.dart';

@RoutePage()
class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({super.key, @PathParam('id') required this.id});
  final String id;

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  late Future<MessageData?> messageData;
  String? username;

  @override
  void initState() {
    super.initState();
    getNews();
    usernamePref;
  }

  get usernamePref async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
  }

  getNews() {
    final profile = Message();
    messageData = profile.getMessageData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: FutureBuilder(future: messageData, builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: screenWidth-0.1*screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1(text: snapshot.data!.title!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.created != null ? 'Erschienen: ${DateTime.parse(snapshot.data!.created!).day}.${DateTime.parse(snapshot.data!.created!).month > 10 ? DateTime.parse(snapshot.data!.created!).month : DateTime.parse(snapshot.data!.created!).month.toString().padLeft(2, '0')}.${DateTime.parse(snapshot.data!.created!).year}, ${DateTime.parse(snapshot.data!.created!).hour}:${DateTime.parse(snapshot.data!.created!).minute > 10 ? DateTime.parse(snapshot.data!.created!).minute : DateTime.parse(snapshot.data!.created!).minute.toString().padLeft(2, '0')} Uhr' : ''),
                          Text(snapshot.data!.lastChanged != null ? 'Geändert: ${DateTime.parse(snapshot.data!.lastChanged!).day}.${DateTime.parse(snapshot.data!.lastChanged!).month > 10 ? DateTime.parse(snapshot.data!.lastChanged!).month : DateTime.parse(snapshot.data!.lastChanged!).month.toString().padLeft(2, '0')}.${DateTime.parse(snapshot.data!.lastChanged!).year}, ${DateTime.parse(snapshot.data!.lastChanged!).hour}:${DateTime.parse(snapshot.data!.lastChanged!).minute > 10 ? DateTime.parse(snapshot.data!.lastChanged!).minute : DateTime.parse(snapshot.data!.lastChanged!).minute.toString().padLeft(2, '0')} Uhr' : ''),
                          Text(snapshot.data!.author != null ? 'Autor: ${snapshot.data!.author}' : ''),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                      thickness: 10,
                    ),
                    CustomText(text: snapshot.data!.text!),
                    const SizedBox(height: 10),
                    if(snapshot.data!.tags!.isNotEmpty)...[
                      Text(
                        'Tags:',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: snapshot.data!.tags!.map((tag) {
                        return Chip(
                          label: Text(tag),
                        );
                      }).toList(),
                    ),
                    const Divider(
                      color: Colors.transparent,
                      thickness: 10,
                    ),
                    if(snapshot.data!.owner == username)...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: () {
                          AutoRouter.of(context).push(MessageEditRoute(id: snapshot.data!.id!));
                          //context.pushRoute(MessageEditRoute(id: snapshot.data!.id!));
                          }, child: const Text('Bearbeiten')),
                          const SizedBox(height: 10, width: 10),
                          ElevatedButton(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Löschen'),
                                  content: const Text('Wollen Sie diesen Eintrag wirklich löschen?'),
                                  actions: [
                                    TextButton(onPressed: () {
                                      AutoRouter.of(context).pop();
                                    }, child: const Text('Abbrechen')),
                                    TextButton(onPressed: () {
                                      Message().deleteMessage(snapshot.data!.id!);
                                      AutoRouter.of(context).pop();
                                      AutoRouter.of(context).push(const MessageRoute());
                                    }, child: const Text('Löschen')),
                                  ],
                                );
                              },
                            );
                          }, child: const Text('Löschen')),
                        ],
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 10,
                      ),
                    ],
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
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