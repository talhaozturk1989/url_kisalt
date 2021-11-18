// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_kisalt/url_shortener_state.dart';

class Gecmis extends StatefulWidget {
  const Gecmis({Key? key}) : super(key: key);

  @override
  _GecmisState createState() => _GecmisState();
}

class _GecmisState extends State<Gecmis> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UrlShortenerState>(
        builder: (context, UrlShortenerState, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Arama Geçmişi'),
        ),
        body: UrlShortenerState.listem.isEmpty
            ? Column( crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('Sonuç Bulunamadı',style: TextStyle(fontSize: 22),),
                      SizedBox(width: 10),
                      Icon(Icons.search_off,size: 32,)
                    ],
                  ),
              ],
            )
            : ListView.builder(
                padding: EdgeInsets.all(4),
                itemCount: UrlShortenerState.listem.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        UrlShortenerState.listem[index],
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          UrlShortenerState.sil(
                              UrlShortenerState.urlController.text);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
