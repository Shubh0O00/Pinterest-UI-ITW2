//Shubham Pandit
//BT19CSE119

//Program Starts Here

//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hovering/hovering.dart';

//main function to run the App
void main() {
  runApp(MyApp());
}

///StatelessWidget for the main App
///returns a Material App
///home is Home class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pinterest",
      //calling Home Stateless Widget
      home: Home(),
    );
  }
}

///Stateless Widget for the Home Page
///Creates the Appbar for the Webapp
///calls the MainBody widget for building the remaining page
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a Scaffold Widget
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 200.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), top: Radius.circular(30)),
        ),
        //adding leading widgets in a Row
        leading: Row(
          children: <Widget>[
            //Using Flexible Widget to adjust the Row dynamically
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                child: Image.asset(
                  'assets/picon.jpg',
                ),
                padding: EdgeInsets.only(left: 10, right: 5),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                child: ElevatedButton(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    //add fucntionality here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    onPrimary: Colors.grey[300],
                    fixedSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(left: 10, right: 5),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                child: ElevatedButton(
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    //add fucntionality here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    onPrimary: Colors.grey[300],
                    fixedSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(left: 10, right: 5),
              ),
            ),
          ],
        ),
        //Title for the AppBar
        title: Padding(
          child: Text(
            'Pinterest',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.only(left: 20, right: 10),
        ),

        //adding actions to add Icons and SearchBar
        actions: <Widget>[
          Container(
            //Container to add a TextField for SearchBar
            width: MediaQuery.of(context).size.width > 1000
                ? MediaQuery.of(context).size.width - 600
                : MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: TextField(
              //TextField Widget for creating Search Bar
              decoration: InputDecoration(
                  //for Decorating the Search Bar
                  prefixIcon: IconButton(
                    //Adding a prefix Search Icon
                    onPressed: () {
                      //add fucntionality here
                    },
                    icon: Icon(Icons.search),
                    color: Colors.grey[600],
                    splashRadius: 20,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          //Adding Other Icons inside Padding Widgets
          Padding(
            //for chat bubble icon
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble),
              hoverColor: Colors.grey[300],
              color: Colors.grey[600],
              splashRadius: 25,
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          Padding(
            //for circle notifications icon
            child: IconButton(
              onPressed: () {
                //add fucntionality here
              },
              icon: Icon(Icons.circle_notifications),
              hoverColor: Colors.grey[300],
              color: Colors.grey[600],
              splashRadius: 25,
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          Padding(
            //for menu icon
            child: IconButton(
              onPressed: () {
                //add fucntionality here
              },
              icon: Icon(Icons.menu),
              hoverColor: Colors.grey[300],
              color: Colors.grey[600],
              splashRadius: 25,
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
          Padding(
            //for a dropdown arrow icon
            child: IconButton(
              onPressed: () {
                //add fucntionality here
              },
              icon: Icon(Icons.arrow_drop_down),
              hoverColor: Colors.grey[300],
              color: Colors.grey[600],
              splashRadius: 25,
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
        ],
      ),
      // calling MainBody() Widget
      body: MainBody(),
    );
  }
}

///StatefulWidget to build the MainBody
///returns a ScrollBar with a StaggeredGridView.countBuilder
class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  //generating List of integers from 1 to 23
  final imageList = List<int>.generate(23, (i) => i + 1);
  //creating a ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    //Widget returning Scrollbar
    return Scrollbar(
      //adding Container as a child to add StaggeredGridView
      isAlwaysShown: true,
      controller: _scrollController,
      child: Container(
        //Container to Store the StaggeredGridView
        width: double.infinity,
        margin: EdgeInsets.all(18.0),
        child: StaggeredGridView.countBuilder(
          //StaggeredGridView.countBuilder as child to add images
          controller: _scrollController,
          itemCount: imageList.length,
          //4 images on horizontal axis
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          itemBuilder: (BuildContext context, int i) {
            return new Container(
              //returning container to hold the image
              decoration: BoxDecoration(
                //adding BoxDecoration for the circular corners
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: HoverCrossFadeWidget(
                //HoverCrossFadeWidget to change the Widget by fading when hovering
                sizeCurve: Curves.linear,
                duration: Duration(milliseconds: 100),
                //firstChild: when the cursor is not hovering
                firstChild: ClipRRect(
                  //for circular borders on images
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //asset image as child
                  child: Image.asset(
                    //adding address
                    //gifs are named 11 and 22
                    'assets/' +
                        imageList[i].toString() +
                        (imageList[i] % 11 == 0 ? ".gif" : ".jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                //firstChild: when the cursor is hovering
                secondChild: Stack(
                  //Stack for adding button on top of the image
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Opacity(
                      //using Opacity to make the image partially transparent
                      opacity: 0.35,
                      child: ClipRRect(
                        //for circular borders on images
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          //adding address
                          //gifs are named 11 and 22
                          'assets/' +
                              imageList[i].toString() +
                              (imageList[i] % 11 == 0 ? ".gif" : ".jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //Adding IconButtons in padding
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        //using Row to add the buttons horizontally
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //Adding the buttons in Flexible Widget to adjust the padding automatically
                          //Using MediaQuery.of(context).size.width to dynamically adjust size of icons
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: IconButton(
                              //for save button
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.033,
                              onPressed: () {
                                //add functionality here
                              },
                              icon: Icon(
                                Icons.save,
                                size: MediaQuery.of(context).size.width * 0.02,
                              ),
                              splashRadius:
                                  MediaQuery.of(context).size.width * 0.02,
                              hoverColor: Colors.grey[700],
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: IconButton(
                              //for home button
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.033,
                              onPressed: () {
                                //add functionality here
                              },
                              icon: Icon(
                                Icons.home,
                                size: MediaQuery.of(context).size.width * 0.02,
                              ),
                              splashRadius:
                                  MediaQuery.of(context).size.width * 0.02,
                              hoverColor: Colors.grey[700],
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: IconButton(
                              //for share button
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.033,
                              onPressed: () {
                                //add functionality here
                              },
                              icon: Icon(
                                Icons.share,
                                size: MediaQuery.of(context).size.width * 0.02,
                              ),
                              splashRadius:
                                  MediaQuery.of(context).size.width * 0.02,
                              hoverColor: Colors.grey[700],
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: IconButton(
                              //for more items button
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.033,
                              onPressed: () {
                                //add functionality here
                              },
                              icon: Icon(
                                Icons.more_vert,
                                size: MediaQuery.of(context).size.width * 0.02,
                              ),
                              splashRadius:
                                  MediaQuery.of(context).size.width * 0.02,
                              hoverColor: Colors.grey[700],
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int i) {
            return StaggeredTile.fit(1);
          },
        ),
      ),
    );
  }
}
//Program Ends Here
//Tested And Successfully Implemented
