import 'package:messenger_chat/constant/data.dart';
import 'package:messenger_chat/pages/chat_detail_page.dart';
import 'package:messenger_chat/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,      
        backgroundColor: black.withOpacity(0.2),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,                                              
          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
          children: <Widget>[  
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://yt3.ggpht.com/ytc/AMLnZu94ON3OFLpRg0WSf207MIsGzOIpBLskIT-pWs_2BQ=s176-c-k-c0x00ffffff-no-rj-mo"),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text(
                  "Chats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Icon(Icons.camera_alt,color: white),
            Icon(Icons.edit,color: white)
          ],
        ),
      ), 
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          unselectedItemColor: white.withOpacity(0.6),
          elevation: 0,          
          backgroundColor: black.withOpacity(0.2),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger, color: blue_story,),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.only(left: 20, right: 20),
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
          child: TextField(
            cursorColor: white.withOpacity(0.4),
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: white.withOpacity(0.6),
                ),
                hintText: "Search",
                hintStyle: TextStyle(color: white.withOpacity(0.6)),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color:  black.withOpacity(0.2)),
                      child: Center(
                        child: Icon(
                          Icons.video_call,
                          color:  white.withOpacity(0.8),
                          size: 33,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: Align(
                          child: Text(
                        'Mulai Menelpon',
                        style: TextStyle(
                              color: white),
                        overflow: TextOverflow.ellipsis,
                      )),
                    )
                  ],
                ),
              ),
              Row(
                  children: List.generate(userStories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 75,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            userStories[index]['story']
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: blue_story, width: 3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    userStories[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userStories[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                            userStories[index]['online']
                                ? Positioned(
                                    top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: online,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: white, width: 3)),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                          userStories[index]['name'],
                          style: TextStyle(
                              color: white),
                          overflow: TextOverflow.ellipsis,
                        )),
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(          
          children: List.generate(userMessages.length, (index) {            
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 10),
                child: Row(                  
                  children: <Widget>[
                    Container(                      
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          userMessages[index]['story']
                              ? Container(                                
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: blue_story, width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userMessages[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              userMessages[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                          userMessages[index]['online']
                              ? Positioned(
                                  top: 48,
                                  left: 52,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: online,
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: white, width: 3)),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userMessages[index]['name'],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500,
                              color: white),                              
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 135,
                          child: Text(
                            userMessages[index]['message'] +
                                " - " +
                                userMessages[index]['created_at'],
                            style: TextStyle(
                                fontSize: 15, color: white.withOpacity(0.6)),
                                overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}
