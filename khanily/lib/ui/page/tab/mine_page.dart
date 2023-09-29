import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khanily/generated/i18n.dart';
import 'package:khanily/model/local_view_model.dart';
import 'package:khanily/model/theme_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(S.of(context).tabUser,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2)),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                UserListWidget(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class UserListWidget extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var iconColor = Theme.of(context).accentColor;
    var localModel = Provider.of<LocaleModel>(context);
    return ListTileTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SliverList(
        delegate: SliverChildListDelegate([
          ListTile(
            title: Text(S.of(context).darkMode),
            onTap: () {
              switchDarkMode(context);
            },
            leading: Transform.rotate(
              angle: -pi,
              child: Icon(
                Theme.of(context).brightness == Brightness.light
                    ? Icons.brightness_5
                    : Icons.brightness_2,
                color: iconColor,
              ),
            ),
            trailing: CupertinoSwitch(
                activeColor: Theme.of(context).accentColor,
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  switchDarkMode(context);
                }),
          ),
          SettingThemeWidget(),
          ListTile(
            title: Text(S.of(context).settingLanguage),
            onTap: () {
              var model = Provider.of<LocaleModel>(context);
              model.switchLocale();
            },
            leading: Icon(
              Icons.public,
              color: iconColor,
            ),
            trailing: CupertinoSwitch(
                activeColor: Theme.of(context).accentColor,
                value: localModel.localeIndex == 0,
                onChanged: (value) {
                  localModel.switchLocale();
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20.0,
            endIndent: 20.0,
          ),
          SizedBox(
            height: 50,
            child: Container(
              width: 200.0,
              alignment: Alignment.bottomCenter,
              child: socialActions(context),
            ),
          ),
          SizedBox(
            height: 30,
            child: Container(
              width: 200.0,
              alignment: Alignment.bottomCenter,
              child: Text('hope you enjoy\n version 1.0.06',style: TextStyle(fontSize: 10.0),),
            ),
          ),
        ]),
      ),
    );
  }

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
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
                    '''mailto:abdo3yash@gmail.com?subject=Support Needed For help App&body=would to tell you!!''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),

          ],
        ),
      );

  void switchDarkMode(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      showToast("dark mode is on", position: ToastPosition.bottom);
    } else {
      Provider.of<ThemeModel>(context).switchTheme(
          userDarkMode: Theme.of(context).brightness == Brightness.light);
    }
  }
}

class SettingThemeWidget extends StatelessWidget {
  SettingThemeWidget();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(S.of(context).theme),
      leading: Icon(
        Icons.color_lens,
        color: Theme.of(context).accentColor,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: <Widget>[
              ...Colors.primaries.map((color) {
                return Material(
                  color: color,
                  child: InkWell(
                    onTap: () {
                      var model = Provider.of<ThemeModel>(context);
                      model.switchTheme(color: color);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                    ),
                  ),
                );
              }).toList(),
              Material(
                child: InkWell(
                  onTap: () {
                    var model = Provider.of<ThemeModel>(context);
                    var brightness = Theme.of(context).brightness;
                    model.switchRandomTheme(brightness: brightness);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).accentColor)),
                    width: 40,
                    height: 40,
                    child: Text(
                      "?",
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
