import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '../../../../core/utils/assets.dart';

class AiView extends StatefulWidget {
  const AiView({super.key});

  @override
  State<AiView> createState() => _AiViewState();
}

class _AiViewState extends State<AiView> {
  final Gemini gemini= Gemini.instance;
  List<ChatMessage> messages=[];
  ChatUser currentUser=ChatUser(id: '0', firstName: "User", );
  ChatUser voygaUser=ChatUser(id: '1', firstName: "Voyga",
 profileImage: AssetsData.logoAllColors);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Voyga, ai travel assistant"),
      ),
      body: _buildUI(),
    );
  }


 Widget _buildUI(){
    return DashChat(

        currentUser: currentUser,
        onSend: _sendMessage,
        inputOptions: InputOptions(
          inputTextStyle: TextStyle(
            color: Colors.black, // Input text color set to black
          ),
          sendButtonBuilder: (Function() send) {
            return IconButton(
              icon: Icon(Icons.send),
              color: Colors.purple, // Send button color set to purple
              onPressed: send,
            );
          },
        ),

        messageOptions: MessageOptions(
          currentUserContainerColor: Colors.purple, // Sent message bubble color set to purple
          currentUserTextColor: Colors.white, // Text color inside sent message bubble
        ),
        messages: messages);
 }
 void _sendMessage(ChatMessage chatMessage){
  setState(() {
    messages=[chatMessage, ...messages];
  });
  try{
    String question=chatMessage.text;
    gemini.streamGenerateContent(question).listen((event){
      ChatMessage? lastMessage=messages.firstOrNull;
      if(lastMessage !=  null && lastMessage.user== voygaUser){
        lastMessage=messages.removeAt(0);
        String response= event.content?.parts?.
        fold("", (previous, current)=>"$previous ${current.text}")??"";
            lastMessage.text +=response;
            setState(() {
              messages=[lastMessage!, ...messages];
            });
      }else{
        String response= event.content?.parts?.
        fold("", (previous, current)=>"$previous ${current.text}")??"";
        ChatMessage message= ChatMessage(user: voygaUser,
            createdAt: DateTime.now(),
        text: response);
        setState(() {
          messages=[message, ...messages];
        });
      }
    });
  }catch(e){
    print(e);
  }
 }
}
