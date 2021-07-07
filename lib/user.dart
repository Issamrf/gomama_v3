import 'package:gomama_v2/models/OurUser.dart';



class UserProfile {
  final String imagePath;
  final String name;
  final String about;
  final String city;
  final String kidsNumb;
  final String age;
  final bool darkMode;

  const UserProfile({
    this.age,
    this.kidsNumb,
    this.imagePath,
    this.name,
    this.city,
    this.about,
    this.darkMode,
  });
}



class UserInfoProfile {
  static const initUser = UserProfile(
    age: '25',
    kidsNumb: '1',
    imagePath: "assets/example.jpg",
    name: 'Tina Merkel',
    city: 'Offenbach',
    about:
        'ich bin Tina 25 ich Studiere International Business. ich habe 2 Kinder und.....',
    darkMode: false,
  );
}
