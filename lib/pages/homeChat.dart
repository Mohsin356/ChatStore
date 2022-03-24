import 'package:chat_store/model/users.dart';
import 'package:chat_store/screens/Conversations.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: const ListConversations(),


    );
  }
  }
  class ListConversations extends StatefulWidget {
    const ListConversations({Key? key}) : super(key: key);

    @override
    State<ListConversations> createState() => _ListConversationsState();
  }

  class _ListConversationsState extends State<ListConversations> {
    @override
    Widget build(BuildContext context) {
      return ListView.separated(
        itemCount: user.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 25.0,
              child:  Text(user[index].letter),
            ),
            title: Text(user[index].name),
            subtitle: Text(user[index].message),

            trailing: Text(user[index].time),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const ConversationScreen()));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),

      );
    }
  }



