import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/screens/message_write_screen.dart';
import 'package:flutter/material.dart';
import '../core/message.dart';
import '../model/message_data.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<MessageData>?> messageDataFuture;
  bool finish = false;

  @override
  void initState() {
    super.initState();

    getNews();
  }

  getNews(){
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
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Nachrichten Page'),
            if (finish) ...[
            FutureBuilder<List<MessageData>?>(
                future: messageDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index].title!),
                              subtitle: Text(snapshot.data![index].text!),
                              trailing: Text(snapshot.data![index].author!),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ] else ...[
              CircularProgressIndicator()
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageWriteScreen(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
