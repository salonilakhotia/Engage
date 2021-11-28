import 'package:flutter/material.dart';
import 'package:engage/widget/Repository.dart';
import '../DisplayFollowers.dart';
import '../DisplayRepos.dart';
import '../DisplayFollowings.dart';

class Detail extends StatefulWidget {
  @required
  String name;
  @required
  int public_repos;
  @required
  int total_followings;
  @required
  int total_followers;

  Detail(
      {required this.name,
     required  this.public_repos,
     required  this.total_followers,
     required  this.total_followings});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.grey.withOpacity(.8),
        elevation: 3,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Column(
                    children: [
                      Text(
                        "Public Repos ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        () {
                          if (widget.public_repos != null) {
                            return "${widget.public_repos}";
                          } else {
                            return "0";
                          }
                        }(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      String urlRepos = 'https://api.github.com/users/' +
                          '${widget.name}' +
                          '/repos';
                          print(urlRepos);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DisplayRepos(urlRepos: urlRepos)));
                    });
                  },
                ),
                InkWell(
                  child: Column(
                    children: [
                      Text(
                        "Following ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        () {
                          if (widget.total_followings != null) {
                            return "${widget.total_followings}";
                          } else {
                            return "0";
                          }
                        }(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      String urlFollowing = 'https://api.github.com/users/' +
                          '${widget.name}' +
                          '/following';
                        print(urlFollowing);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DisplayFollowers(urlFollowers: urlFollowing)));
                    });
                  },
                ),
                InkWell(
                  child: Column(
                    children: [
                      Text(
                        "Followers ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        () {
                          if (widget.total_followers != null) {
                            return "${widget.total_followers}";
                          } else {
                            return "0";
                          }
                        }(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      String urlFollower = 'https://api.github.com/users/' +
                          '${widget.name}' +
                          '/followers';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DisplayFollowers(urlFollowers: urlFollower)));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
