import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_store/model/messages.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key,required this.name,required this.letter}) : super(key: key);
final String name;
final String letter;
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController message = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
           IconButton (icon: const Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
            Navigator.pop(context);},),
               CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child:  Text(widget.letter,style: const TextStyle(color: Colors.green),),
              ),
              const SizedBox(width:10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(widget.name,style: const TextStyle(color: Colors.white,fontSize: 16 ,fontWeight: FontWeight.w600),),
                    const Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                  ],

                ),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.video_call,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.call,color: Colors.white,)),
              PopupMenuButton(
                child: const Icon(
                  Icons.more_vert,color: Colors.white,
                ),
                      color: Colors.green,
                      itemBuilder: (BuildContext context){
                        return
                      [
                        const PopupMenuItem(
                        child: Text("View Contacts",style: TextStyle(color: Colors.white),),
                    ),
                        const PopupMenuItem(
                        child: Text("Media,links, and docs",style: TextStyle(color: Colors.white),),
                        ),
                        const PopupMenuItem(
                        child: Text("Search",style: TextStyle(color: Colors.white),),
                        ),
                        const PopupMenuItem(
                        child: Text("Mute notifications",style: TextStyle(color: Colors.white),),
                        ),
                        const PopupMenuItem(
                        child: Text("Wallpaper",style: TextStyle(color: Colors.white),),
                        ),


                        ];
            },
                  ),
            ],
          ),
          ),
        ),


      ),
      body: Stack(
        children:  [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(itemCount:messagesList.length ,
              shrinkWrap: true,
                controller: scrollController,
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              itemBuilder: (context,index){
              return Container(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Align(
                  alignment: (messagesList[index].messageType=="receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:(messagesList[index].messageType=="receiver"?Colors.lightBlue[400]:Colors.green),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(messagesList[index].messageBody,style: const TextStyle(fontSize: 15,color: Colors.white,)),

                  ),
                )
              );
              },
            ),
          ),
           Align(
            alignment: Alignment.bottomLeft,
             child: Container(
               padding: const EdgeInsets.only(left: 10, bottom: 10,top: 10),
               height: 60,
               width: double.infinity,
               color: Colors.white,
               child: Row(
                 children: [
                   GestureDetector(
                     onTap: (){},
                     child: Container(
                       height: 30,
                       width: 30,
                       decoration:  BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(30),
                       ),
                       child: const Icon(Icons.add,color: Colors.white,size: 20,),
                     ),
                   ),
                  const SizedBox(width: 15,),
                      Expanded(
                       child:TextField(
                         controller: message,
                         cursorColor: Colors.green,
                         decoration: const InputDecoration(
                           hintText: "Write message here....",
                           border: InputBorder.none,
                         ),

                       )),
                   const SizedBox(width: 15,),
                   FloatingActionButton(onPressed: (){
                     setState(() {
                       messagesList.add(Message(message.text.trim(), "sender"),);
                       message.clear();
                       scrollController.jumpTo(scrollController.position.maxScrollExtent+60);
                     });
                   },
                   child: const Icon(Icons.send,color: Colors.white,size: 18,),
                   backgroundColor: Colors.green,
                   elevation: 0,),
                 ],
               ),
             ),
          ),
        ],
      ),

    );
  }
}
