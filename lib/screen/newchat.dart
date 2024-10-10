import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewChat extends StatefulWidget {
  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  List<String> _ingredients = [];
  String? _link;
  late YoutubePlayerController _youtubeController;
  final defaultLink = "https://youtu.be/dQw4w9WgXcQ?si=MBYyj9Jc4Isoxyo0";

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube controller with the default video ID
    final vidid = YoutubePlayer.convertUrlToId(defaultLink);
    _youtubeController = YoutubePlayerController(
      initialVideoId: vidid!,
      flags: YoutubePlayerFlags(
        controlsVisibleAtStart: true,
      ),
    );
  }

  void _sendRequest() async {
    setState(() {
      _response = "Working on it...may take a few seconds";
    });

    String prompt = _ingredients.join(', ') + ' give me a recipe, the a relevant youtube link is 100% necessary';
    print(prompt);
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: dotenv.env['TOKEN'] ?? '',
    );

    final response = await model.generateContent([Content.text(prompt)]);
    String formattedResponse = response.text?.replaceAll('*', '').trim() ?? 'No response';
    print(formattedResponse.toString());

    setState(() {
      _response = formattedResponse;
      _link = defaultLink; 
      _ingredients.clear();
    });
  }

  void _addIngredient() {
    String input = _controller.text;
    if (input.isNotEmpty) {
      setState(() {
        _ingredients.add(input);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.grey[300]!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'RECEP-AI',
          style: TextStyle(letterSpacing: 10),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),

          // Youtube Player
          // YoutubePlayer(
          //   controller: _youtubeController,
          //   showVideoProgressIndicator: true,
          // ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      if (_response.isEmpty)
                        Text('Start chatting!')
                      else
                        Column(
                          children: [
                
                            Text(_response), 
                             SizedBox(height: 10),
                            if (_link != null)
                              Container(
                                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                                child: YoutubePlayer(
                                  controller: _youtubeController,
                                  showVideoProgressIndicator: true,
                                  //progressColors: ProgressBarColors(),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  children: _ingredients.map((ingredient) {
                    return Chip(
                      label: Text(ingredient),
                      onDeleted: () {
                        setState(() {
                          _ingredients.remove(ingredient);
                        });
                      },
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        autofocus: true,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: backgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 11, 65, 146),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Type ingredient',
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: _addIngredient,
                              ),
                              IconButton(
                                icon: Icon(AntDesign.arrow_up_outline),
                                onPressed: _sendRequest,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
