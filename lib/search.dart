import 'package:flutter/material.dart';
import 'package:gomama_v2/setting.dart';
import 'package:gomama_v2/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition camPosInit =
        CameraPosition(target: LatLng(50.1106444, 8.6820917));
    final user = UserInfoProfile.initUser;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "in der nähe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.logout,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff3b93c3),
                  width: 2.5,
                ),
              ),

              height: MediaQuery.of(context).copyWith().size.height / 2,
              
              child: GoogleMap(
                initialCameraPosition: camPosInit,
                mapType: MapType.normal,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Kontakt',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    //color: Color(0xff3b93c3),
                    border: Border.all(
                      color: Color(0xff3b93c3),
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {},
                  ),

    
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final user = UserInfoProfile.initUser;
  final String imagePath;
  final VoidCallback onClicked;
  const ProfileWidget({
    key,
    this.imagePath,
    this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Alter',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  user.age,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  user.city,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = AssetImage("assets/example.jpg");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 110,
          height: 110,
          child: InkWell(splashColor: Color(0xff3b93c3), onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
