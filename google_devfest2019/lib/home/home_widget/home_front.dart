import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:use/agenda/agenda_page.dart';
import 'package:use/config/index.dart';
import 'package:use/market/market_page.dart';
import 'package:use/pharm/pharmacy_page.dart';
import 'package:use/resturant/resturant_page.dart';
import 'package:use/speakers/speakers_page.dart';
import 'package:use/universal/image_card.dart';
import 'package:use/utils/devfest.dart';
import 'package:use/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ];

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://facebook.com/abdalla.3yash");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/idk3yash");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://linkedin.com/in/abdalla-ayash");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () async {
                await _launchURL("https://github.com/abdalla3yash");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                await _launchURL("https://instagram.com/a_3yash");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:abdo3yash@gmail.com?subject=Support Needed For DevFest App&body={Name: Abdalla Ayash},Email: abdo3yash@gmail.com}''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );
  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            title: Devfest.agenda_text,
            icon: Icons.schedule,
            color: Colors.amber,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ActionCard(
            title: Devfest.speaker_text,
            icon: Icons.person,
            color: Colors.green,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakersPage.routeName),
          ),
          ActionCard(
            title: Devfest.team_text,
            icon: Icons.people,
            color: Colors.red,
            onPressed: () => Navigator.pushNamed(context, MarketPage.routeName),
          ),
          ActionCard(
            title: Devfest.sponser_text,
            icon: Icons.attach_money,
            color: Colors.orange,
            onPressed: () =>
                Navigator.pushNamed(context, ResturantPage.routeName),
          ),
          ActionCard(
            title: Devfest.faq_text,
            icon: Icons.question_answer,
            color: Colors.brown,
            onPressed: () =>
                Navigator.pushNamed(context, PharmacyPage.routeName),
          ),
          ActionCard(
            title: Devfest.map_text,
            icon: Icons.location_searching,
            color: Colors.blue,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 213.0,
              width: double.infinity,
              child: Carousel(
                images: [
                  AssetImage('images/pic1.png'),
                  AssetImage('images/pic2.jpg'),
                  AssetImage('images/pic3.jpg'),
                ],
                boxFit: BoxFit.fitWidth,
                showIndicator: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            SizedBox(
              height: 20,
            ),
            socialActions(context),
            SizedBox(
              height: 20,
            ),
            Text(
              'wish to help you\n' + Devfest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1F2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                      color: Colors.grey[200], blurRadius: 10, spreadRadius: 5),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
