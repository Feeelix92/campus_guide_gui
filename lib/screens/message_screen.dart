import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

@RoutePage()
class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Future<List<MessageData>?> messageDataFuture;
  bool finish = false;

  @override
  void initState() {
    super.initState();

    getNews();
  }

  getNews() {
    final profile = Message();
    messageDataFuture = profile.getMessagesData();
    print(messageDataFuture);
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
            const H1(text: 'Nachrichten Page'),
            if (finish) ...[
              FutureBuilder<List<MessageData>?>(
                  future: messageDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  title: Text(snapshot.data![index].title!),
                                  subtitle: Text(
                                    snapshot.data![index].text!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  trailing: Text(snapshot.data![index].created != null ? '${DateTime.parse(snapshot.data![index].created!).day}.${DateTime.parse(snapshot.data![index].created!).month > 10 ? DateTime.parse(snapshot.data![index].created!).month : DateTime.parse(snapshot.data![index].created!).month.toString().padLeft(2, '0')}.${DateTime.parse(snapshot.data![index].created!).year}' : ''),
                                  onTap: () {
                                    context.pushRoute(MessageDetailRoute(id: snapshot.data![index].id!));
                                  }),
                            );
                          },
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
          AutoRouter.of(context).push( const MessageWriteRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


