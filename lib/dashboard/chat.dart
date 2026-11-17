import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  List<Map<String, String>> chatdata = [
    {
      'image':
          'https://img.freepik.com/premium-photo/handsome-black-man-demonstrating-cellphone-with-black-screen_922936-36390.jpg',
      'title': 'Michael Josh',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '10 min',
      'msg': '2'
    },
    {
      'image':
          'https://i.etsystatic.com/32055372/r/il/99bf98/5611093915/il_fullxfull.5611093915_q69p.jpg',
      'title': 'Tony Spark',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '15 min',
      'msg': '3'
    },
    {
      'image':
          'https://m.media-amazon.com/images/I/717jzjoneVL._UF894,1000_QL80_.jpg',
      'title': 'Brett Aston',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '12 min',
      'msg': '1'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Chat",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: "Search",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            Column(
              children: List.generate(chatdata.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailPage(
                              name: chatdata[index]['title']!,
                              image: chatdata[index]['image']!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Profile Image
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(chatdata[index]['image']!),
                              radius: 30,
                            ),
                            const SizedBox(width: 12),

                            /// Title + Subtitle
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatdata[index]['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chatdata[index]['subtitle']!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Time + Message Count
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  chatdata[index]['time']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Themeorangecolor,
                                  child: Text(
                                    chatdata[index]['msg']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String name;
  final String image;

  ChatDetailPage({super.key, required this.name, required this.image});

  final List<Map<String, String>> messages = [
    {"text": "Hello! How are you?", "isMe": "false"},
    {"text": "I'm fine, thank you! What about you?", "isMe": "true"},
    {"text": "Doing great, working on my project, really amazing!", "isMe": "false"},
    {"text": "Wow, that's awesome!", "isMe": "true"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(image)),
            const SizedBox(width: 8),
            Text(name,style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = messages[index]['isMe'] == "true";
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.orange[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(messages[index]['text']!),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Themeorangecolor),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}