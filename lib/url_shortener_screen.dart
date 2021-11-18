// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_types_as_parameter_names, non_constant_identifier_names, duplicate_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_kisalt/url_shortener_state.dart';
import 'package:url_kisalt/gecmis.dart';
import 'package:url_kisalt/url_shortener_state.dart';

import 'gecmis.dart';

class UrlShortenerScreen extends StatelessWidget {
  const UrlShortenerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UrlShortenerState>(
        builder: (context, UrlShortenerState, child) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.orange,),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        backgroundColor: Colors.orange,
                        child: Image.network(
                          'https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png',
                          fit: BoxFit.cover,
                          cacheWidth: 70,
                          cacheHeight: 70,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Talha Öztürk',
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'talhaozturk@gmail.com',
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.only(bottom: 90),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gecmis()));
                },
                child: ListTile(
                  title: Text(
                    'Arama Geçmişi',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "URL Kısaltma",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Flutter Url Shorten",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: UrlShortenerState.urlController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        UrlShortenerState.urlController.clear();
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "url giriniz...",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Builder(
                  builder: (context) => Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(UrlShortenerState.shortUrlMessage),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(onTap: (){   Clipboard.setData(ClipboardData(
                            text: UrlShortenerState.shortUrlMessage))
                        .whenComplete(() => Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("bağlanti kopyalandi"))));},
                        child: Icon(Icons.copy))
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      UrlShortenerState.handleGetLinkButton();
                      UrlShortenerState.ekle(
                          UrlShortenerState.urlController.text);
                    },
                    child: Text("url kısalt"),
                    color: Colors.orange,
                    textColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
