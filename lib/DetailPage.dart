import 'package:flutter/material.dart';
import 'Student.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Student data;

  DetailPage({required this.data});

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: data.ids,
                  child: CircleAvatar(
                    radius: 75, // ขนาดที่ใหญ่ขึ้น
                    backgroundImage: AssetImage(data.images),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('ID Student:', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  subtitle: Text(data.ids, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Email:', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  subtitle: Text(data.email, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Info:', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  subtitle: Text(data.info, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Social Link:', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  subtitle: InkWell(
                    child: Text(
                      data.SocialLink,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                    onTap: () => _launchURL(data.SocialLink),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Return', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
