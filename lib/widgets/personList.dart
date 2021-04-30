import 'package:flutter/material.dart';

class Person {
  String name;
  String image;
  String degree;
  Person(String name, image, degree) {
    this.name = name;
    this.image = image;
    this.degree = degree;
  }
  getName() {
    return name;
  }

  getImage() {
    return image;
  }

  getDegree() {
    return degree;
  }
}

String getImagePath(String path) {
  return "assets/images/$path";
}

Person person1 = new Person('Ahmet Cevahir Çınar',
    getImagePath('cevahir-cinar.jpeg'), 'Dr. Öğr. Üyesi');
Person person2 =
    new Person('Tahir Sağ', getImagePath('tahir-sag.jpeg'), 'Dr. Öğr. Üyesi');
Person person3 = new Person(
    'Erdem Ağbahça', getImagePath('erdem-agbahca.jpeg'), 'Arş. Gör.');
Person person4 = new Person(
    'Selahattin Alan', getImagePath('selahattin-alan.jpeg'), 'Dr. Öğr. Üyesi');
Person person5 = new Person(
    'Fatih Başçiftçi', getImagePath('fatih-basciftci.jpeg'), 'Prof. Dr.');

List<Person> people = [person1, person2, person3, person4, person5];

class PersonList extends StatefulWidget {
  @override
  PersonListState createState() => PersonListState();
}

class PersonListState extends State<PersonList> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildRow(Person person) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/scholar', arguments: {
          'name': person.getName(),
          'image': person.getImage(),
          'degree': person.getDegree()
        });
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                  person.getImage(),
                  height: 40,
                ),
              ),
            ),
            Text(
              person.getName(),
              style: _biggerFont,
            ),
          ]),
          Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      padding: EdgeInsets.all(16.0),
      itemCount: people.length,
      itemBuilder: (context, i) {
        return _buildRow(people[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
