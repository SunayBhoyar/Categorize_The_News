import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

Future Getdata(url) async {
  http.Response Response = await http.get(Uri.parse(url));
  return Response.body;
}

// ignore: must_be_immutable
class IndiPage extends StatefulWidget {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  IndiPage(
      {super.key,
      this.author,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage,
      this.content});

  @override
  State<IndiPage> createState() => _IndiPageState();
}

class _IndiPageState extends State<IndiPage> {
  late var tarun = '  ' ;
  @override

  Widget build(BuildContext context) {
    // var url = "www.google.com";

    var Data;

    String QueryText = 'Query';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 91, 0, 140),
      body: Stack(
        children: [
          Image.network(
            widget.urlToImage ??
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fwhite&psig=AOvVaw0i4DsAfbXSvJxV2ovFyKRx&ust=1671035012769000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLChnNSA9_sCFQAAAAAdAAAAABAE",
            fit: BoxFit.fitHeight,
            height: 250,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 247, 247, 247).withOpacity(0),
                  const Color.fromARGB(255, 91, 0, 140),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white.withOpacity(0.4)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.title ?? "Title not found",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style:  ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color.fromARGB(
                                255, 91, 0, 140)),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        Data = await Getdata("http://127.0.0.1:5000/res?Query=${widget.title}");
                        var Datadecoded = jsonDecode(Data);
                        setState((){
                          QueryText = Datadecoded["completions"][0]["data"]["text"];
                          QueryText = QueryText.substring(1,QueryText.length - 2);
                        });
                        tarun = await QueryText ;
                        setState(() {});
                      },

                      child: const Text("Get the category",
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Text(
                      tarun,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.yellow)
                      ,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Published at - ${widget.publishedAt}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.description ?? "no data found",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.content ?? "no data found",
                  maxLines: 5,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white.withOpacity(0.4)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse('${widget.url}'));
                    },
                    child: const Text("Get more content ->")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
