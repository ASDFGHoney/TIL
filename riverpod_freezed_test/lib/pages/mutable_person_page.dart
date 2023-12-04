import 'package:flutter/material.dart';
import 'package:riverpod_freezed_test/models/mutable_person.dart';

class MutablePersonPage extends StatelessWidget {
  const MutablePersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = MutablePerson(id: 1, name: 'john', email: 'jon@gmail.com');
    // person1.id = 2;
    person1.name = 'john doe';
    person1.email = 'john@gmial.com';
    print(person1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutable Person'),
      ),
    );
  }
}
