import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/screens/Login.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user;
  bool isDark;

  @override
  void initState() {
    _getTheme();
    super.initState();
    this.user = _firebaseAuth.currentUser;
  }

  Future<void> _getTheme() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    setState(() {
      isDark = savedThemeMode.isDark;
    });
  }

  void openBrowser(String url) {
    FlutterWebBrowser.openWebPage(
        url: url,
        customTabsOptions: CustomTabsOptions(
            colorScheme: CustomTabsColorScheme.dark,
            toolbarColor: Colors.blue,
            secondaryToolbarColor: Colors.white,
            addDefaultShareMenuItem: true,
            instantAppsEnabled: true,
            showTitle: true,
            urlBarHidingEnabled: true));
  }

  Future<void> handleSignOut() async {
    await _firebaseAuth.signOut();
    Fluttertoast.showToast(msg: "Çıkış Yapıldı");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Haber "),
            Text(
              "Uygulaması",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              handleSignOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CircleAvatar(
                  backgroundImage: user.photoURL == null
                      ? AssetImage(
                          "assets/user.png",
                        )
                      : NetworkImage(user.photoURL),
                  radius: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                user.email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Karanlık Tema : ",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Switch(
                      activeColor: Colors.blue,
                      value: isDark,
                      onChanged: (value) {
                        isDark = !isDark;
                        AdaptiveTheme.of(context).toggleThemeMode();
                      })
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                "Haber Kaynağı : ",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Divider(
              height: 5,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Anadolu Ajansı"),
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdnassets.aa.com.tr/assets/images/aalogomin.png",
                    height: 30,
                    color: isDark ? Colors.white : Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                "Geliştirici : ",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Divider(
              height: 5,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("İdris Can Bölükbaşı", style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () => openBrowser(
                              "https://www.instagram.com/idriscanbolukbasi/"),
                          child: Image.asset(
                            "assets/instagram_icon.png",
                            height: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () => openBrowser(
                              "https://www.linkedin.com/in/idriscanbolukbasi/"),
                          child: Image.asset(
                            "assets/linkedin_icon.png",
                            height: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () =>
                              openBrowser("https://github.com/icanbolukbasi"),
                          child: Image.asset(
                            "assets/github_icon.png",
                            height: 40,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                "Uygulama Bilgileri : ",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Divider(
              height: 5,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Haber ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Uygulaması",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    "v1.2",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
