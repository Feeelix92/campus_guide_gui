import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/screens/message_write_screen.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

@RoutePage()
class DetailMessageScreen extends StatefulWidget {

  final String messageID;

  const DetailMessageScreen({Key? key,@PathParam.inherit('id') required this.messageID})
      : super(key: key);


  @override
  State<DetailMessageScreen> createState() => _DetailMessageScreenState();
}

class _DetailMessageScreenState extends State<DetailMessageScreen> {
  @override

  late Future<MessageData?> messageData;
  bool finish = false;

  @override
  void initState() {
    super.initState();

    getNews();
  }

  getNews() {
    final profile = Message();
    messageData = profile.getMessageData(widget.messageID);
    setState(() {
      finish = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Detail Page'),
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
                return CircularProgressIndicator();
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
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}