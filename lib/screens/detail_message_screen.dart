import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

@RoutePage()
class DetailMessageScreen extends StatefulWidget {
  const DetailMessageScreen({super.key, @PathParam('id') required this.id});
  final String id;


  @override
  State<DetailMessageScreen> createState() => _DetailMessageScreenState();
}

class _DetailMessageScreenState extends State<DetailMessageScreen> {
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
      body: Center(
        child: Column(
          children: [
            const H1(text: 'Detail Page'),
            FutureBuilder(future: messageData, builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.title!),
                    Text(snapshot.data!.text!),
                    Text(snapshot.data!.author ?? 'Anonym'),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}