import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
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
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child:  Text("A"),
              ),
              const SizedBox(width:10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Ali",style: TextStyle(color: Colors.white,fontSize: 16 ,fontWeight: FontWeight.w600),),
                    Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
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
                    const  Expanded(
                       child:TextField(
                         cursorColor: Colors.green,
                         decoration: InputDecoration(
                           hintText: "Write message here....",
                           border: InputBorder.none,
                         ),

                       )),
                   const SizedBox(width: 15,),
                   FloatingActionButton(onPressed: (){},
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
