import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String message;

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedUser = user;
      print('loggedUser= $user');
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  /* void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print('meg data= ${message.data()}');
        //  print('msgSender= ${message.data()['sender']}');
      }
      print('------------------------------------------');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // messagesStream();
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      var time = DateTime.now();
                      print('currentTime = $time');
                      _firestore.collection('messages').add({
                        'text': message,
                        'sender': loggedUser.email,
                        'send_time': DateTime.now(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      /*
        steam where the data come from stream of {QuerySnapshot}
        QuerySnapshot is a class from firestore which contain the chat messages
      */
      stream: _firestore
          .collection('messages')
          .orderBy('send_time', descending: true)
          .snapshots(),
      builder: (context, snapshot) => messagesWidget(context, snapshot),
    );
  }

  /// snapshot: async snapshot contains our query snapshot from Firebase
  Widget messagesWidget(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    } else {
      final messages = snapshot.data.docs;
      List<MessageBubble> messagesBubbles = [];
      for (QueryDocumentSnapshot message in messages) {
        final messageSender = message.data()['sender'];
        final messageText = message.data()['text'];

        final currentUser = loggedUser.email;

        final messageBubble = MessageBubble(
          sender: messageSender,
          text: messageText,
          isMe: currentUser == messageSender,
        );
        messagesBubbles.add(messageBubble);
      }
      /*
        wrap the list view inside an expanded widget. This way it won't try to take over the whole
        screen and only take up as much space as is available.
       */
      return Expanded(
        child: ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: messagesBubbles,
        ),
      );
    }
  }
}
