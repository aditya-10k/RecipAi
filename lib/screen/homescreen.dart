import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:recipeai/screen/chathistory.dart';
import 'package:recipeai/screen/newchat.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key, required this.onThemeChanged, required this.themeMode });
    final VoidCallback onThemeChanged;
  final ThemeMode themeMode;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  

final List<Widget> screen = [
NewChat(),
Chathistory(),

];

int currentindex = 0;

final PageController _controller = PageController(initialPage: 0);

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
         leading: IconButton(onPressed: widget.onThemeChanged ,
          
         icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),),
      ),

      body: PageView(
        children: screen,
        controller: _controller ,
        onPageChanged: (index){
          setState(() {
            currentindex = index;
          });
        },
      ),

      bottomNavigationBar: FloatingNavigationBar(
        backgroundColor: backgroundColor ,
        indicatorColor: Colors.transparent,
        items:
        [
          NavBarItems(icon:currentindex==0? Bootstrap.chat_fill : Bootstrap.chat , title: 'Chat'),
          NavBarItems(icon:currentindex==1? MingCute.history_fill : MingCute.history_line , title: 'History')
        ], 
        onChanged: (index){
          setState(() {
            currentindex = index;
            _controller.jumpToPage(index);
          });
        },
        
        ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}