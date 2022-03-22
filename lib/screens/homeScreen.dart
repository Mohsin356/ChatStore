import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chat_store/pages/homeChat.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{

  @override

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 4, initialIndex: 1,
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: const Text("ChatStore",),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            color: Colors.green,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("New group",style: TextStyle(color: Colors.white),),
                ),
                const PopupMenuItem(
                  child: Text("New broadcast",style: TextStyle(color: Colors.white),),
                ),
                const PopupMenuItem(
                  child: Text("Whatsapp Web",style: TextStyle(color: Colors.white),),
                ),
                const PopupMenuItem(
                  child: Text("Starred messages",style: TextStyle(color: Colors.white),),
                ),
                const PopupMenuItem(
                  child: Text("Settings",style: TextStyle(color: Colors.white),),
                ),
              ];
            },
          )
    ],
        bottom: const TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
        body:const SafeArea(
        child:TabBarView(
          children: [
            Text("Camera"),
            ChatHome(),
            Text("Status"),
            Text("Calls"),
          ],
        ),
      ),

      ),

    );
  }
}
