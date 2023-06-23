import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:flutter/material.dart';
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
  bool finish = false;

  @override
  void initState() {
    super.initState();

    getNews();
  }

  getNews() {
    final profile = Message();
    messageData = profile.getMessageData(widget.id);
    setState(() {
      finish = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: FutureBuilder(future: messageData, builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              H1(text: snapshot.data!.title!),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(snapshot.data!.created != null ? 'Erschienen: ${DateTime.parse(snapshot.data!.created!).day}.${DateTime.parse(snapshot.data!.created!).month > 10 ? DateTime.parse(snapshot.data!.created!).month : DateTime.parse(snapshot.data!.created!).month.toString().padLeft(2, '0')}.${DateTime.parse(snapshot.data!.created!).year}, ${DateTime.parse(snapshot.data!.created!).hour}:${DateTime.parse(snapshot.data!.created!).minute > 10 ? DateTime.parse(snapshot.data!.created!).minute : DateTime.parse(snapshot.data!.created!).minute.toString().padLeft(2, '0')}' : ''),
                    Text(snapshot.data!.lastChanged != null ? ' Geändert: ${DateTime.parse(snapshot.data!.lastChanged!).day}.${DateTime.parse(snapshot.data!.lastChanged!).month > 10 ? DateTime.parse(snapshot.data!.lastChanged!).month : DateTime.parse(snapshot.data!.lastChanged!).month.toString().padLeft(2, '0')}.${DateTime.parse(snapshot.data!.lastChanged!).year}, ${DateTime.parse(snapshot.data!.lastChanged!).hour}:${DateTime.parse(snapshot.data!.lastChanged!).minute > 10 ? DateTime.parse(snapshot.data!.lastChanged!).minute : DateTime.parse(snapshot.data!.lastChanged!).minute.toString().padLeft(2, '0')}' : ''),
                    Text(snapshot.data!.author != null ? ' Autor: ${snapshot.data!.author}' : ''),
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
                thickness: 10,
              ),
              CustomText(text: snapshot.data!.text!),
              const Divider(
                color: Colors.transparent,
                thickness: 10,
              ),
              ElevatedButton(onPressed: () {
                // AutoRouter.of(context).push( MessageEditRoute(id: snapshot.data!.id!));
                context.pushRoute(MessageEditRoute(id: snapshot.data!.id!));
              }, child: const Text('Bearbeiten')),

            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}