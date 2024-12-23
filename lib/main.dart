import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentRegistration(),
    );
  }
}

class StudentRegistration extends StatefulWidget {
  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final _formKey = GlobalKey<FormState>();
  String? firstName, lastName, email, phone, city, password;
  String? gender;
  List<String> hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onSaved: (value) => firstName = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your first name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onSaved: (value) => lastName = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your last name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => phone = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your phone number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => city = value,
                validator: (value) => value!.isEmpty ? 'Enter your city' : null,
              ),
              Row(
                children: [
                  Text('Gender:'),
                  Radio(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              Text('Hobbies:'),
              CheckboxListTile(
                title: Text('Cricket'),
                value: hobbies.contains('Cricket'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      hobbies.add('Cricket');
                    } else {
                      hobbies.remove('Cricket');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Football'),
                value: hobbies.contains('Football'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      hobbies.add('Football');
                    } else {
                      hobbies.remove('Football');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Chess'),
                value: hobbies.contains('Chess'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      hobbies.add('Chess');
                    } else {
                      hobbies.remove('Chess');
                    }
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => password = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle registration logic here
                    print('First Name: $firstName');
                    print('Last Name: $lastName');
                    print('Email: $email');
                    print('Phone: $phone');
                    print('City: $city');
                    print('Gender: $gender');
                    print('Hobbies: $hobbies');
                    print('Password: $password');
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
