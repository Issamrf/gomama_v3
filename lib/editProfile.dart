import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagebottomnavigation/Profile.dart';
import 'package:gomama_v2/services/Database.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:gomama_v2/user.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  List userProfilesList = [];
  var userID;
  CurrentUser currentUser;

  TextEditingController formAbout = TextEditingController();
  TextEditingController formBirthday = TextEditingController();
  TextEditingController formCity = TextEditingController();
  //TextEditingController formEmail = TextEditingController();
  TextEditingController formName = TextEditingController();
  TextEditingController formKids = TextEditingController();
  TextEditingController formPlz = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CurrentUser me = Provider.of<CurrentUser>(context) as CurrentUser;
    this.formAbout.text = me.currentUser.about;
    this.formBirthday.text = me.currentUser.birth;
    this.formCity.text = me.currentUser.city;
    //this.formEmail.text = me.currentUser.email;
    this.formName.text = me.currentUser.name;
    this.formKids.text = me.currentUser.kids;
    this.formPlz.text = me.currentUser.plz;

    final user = UserInfoProfile.initUser;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit Profil",
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
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(30),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imageDirection: user.imagePath,
                ifEdit: true,
                onPressed: () async {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                controller: formName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "Name",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                controller: formCity,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  hintText: "Stadt",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: formKids,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.child_care),
                  hintText: "Kinder",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: formPlz,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.map_outlined),
                  hintText: "PLZ",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                keyboardType: TextInputType.multiline,
                controller: formAbout,
                maxLines: 8,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Über mich",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  //firebase setting
                  onPressed: () {
                    submitAction(context);
                  },
                  color: Color(0xff3b93c3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Speichern",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  submitAction(BuildContext context) {
    Database().updateUserData(
      Provider.of<CurrentUser>(context, listen: false).currentUser.uid,
      birth: formBirthday.text,
      city: formCity.text,
      email: Provider.of<CurrentUser>(context, listen: false).currentUser.email,
      name: formName.text,
      plz: formPlz.text,
      kids: formKids.text,
      about: formAbout.text,
    );
  }
}
