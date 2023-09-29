import 'package:dm_development/structure/post.dart';
import 'package:dm_development/structure/story.dart';
import 'package:dm_development/structure/timeline.dart';
import 'package:flutter/material.dart';

var postImages = {
  0: "assets/profile.png",
  1: "assets/profile.png",
  2: "assets/profile.png",
  3: "assets/profile.png",
  4: "assets/profile.png",
};
var postNames = {
  0: "ayash",
  1: "abdelhady",
  2: "nashwa",
  3: "hosni",
  4: "reda"
};
var postContents = {
  0: "هنروح امتى ياخونا؟",
  1: "التعديلات خلصت يابشمهندسين",
  2: "هنتغدي ايه ياجماعه",
  3: "in my way to matroo7 have fun to all.",
  4: "i'm going to another work bye!"
};
var postTimes = {
  0: "10 mins ago · ",
  1: "20 mins ago · ",
  2: "1 hour ago · ",
  3: "1 hour ago · ",
  4: "2 hours ago · "
};

var postImage = {
  0:null,
  1:null,
  2: "assets/dog.jpg",
  3: null,
  4: null
};
var postLikes = {
  0: "abdelhady and 6 others",
  1: "hosni and 16 others",
  2: "reda and 6 others",
  3: "ayash and 16 others",
  4: "abdalla and 46 others"
};
var postComments = {0: "12", 1: "24", 2: "16", 3: "34", 4: "46"};
var postShares = {0: "1", 1: "2", 2: "3", 3: "2", 4: "2"};

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key}) : super(key: key);

  @override
  _TimelinePageState createState() => new _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            NewPost(),
            Card(),
            StoryBox(),
            FacebookPostCard(
                image: postImages[0],
                content: postContents[0],
                name: postNames[0],
                likes: postLikes[0],
                postimage: postImage[0],
                comments: postComments[0],
                shares: postShares[0],
                time: postTimes[0]),
            FacebookPostCard(
                image: postImages[1],
                content: postContents[1],
                name: postNames[1],
                postimage: postImage[1],
                likes: postLikes[1],
                comments: postComments[1],
                shares: postShares[1],
                time: postTimes[1]),
            FacebookPostCard(
                image: postImages[2],
                content: postContents[2],
                name: postNames[2],
                postimage: postImage[2],
                likes: postLikes[2],
                comments: postComments[2],
                shares: postShares[2],
                time: postTimes[2]),
            FacebookPostCard(
                image: postImages[3],
                content: postContents[3],
                name: postNames[3],
                postimage: postImage[3],
                likes: postLikes[3],
                comments: postComments[3],
                shares: postShares[3],
                time: postTimes[3]),
            FacebookPostCard(
                image: postImages[4],
                content: postContents[4],
                name: postNames[4],
                postimage: postImage[4],
                likes: postLikes[4],
                comments: postComments[4],
                shares: postShares[4],
                time: postTimes[4]),
          ],
        ),
      )
    );

  }
}
