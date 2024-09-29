import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[150],
        appBar: AppBar(
          title: Text("Med Friend"),
          backgroundColor: Colors.deepPurple[100],
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('john.doe@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.example.com/images/profile.jpg',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                ),
              ),
              // Home Navigation Option
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                },
              ),

              // History Navigation Option
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                  
                },
              ),

              // Check Symptoms Navigation Option
              ListTile(
                leading: Icon(Icons.medical_services),
                title: Text('Check Symptoms'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                  
                },
              ),

              Divider(), // Divider between sections

              // Settings
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                  
                },
              ),

              // Help & About
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help & FAQ'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigation
                },
              ),

              Divider(), // Divider between sections

              // Logout Option
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context); // Handle logout and close drawer
                },
              ),
            ],
          ),
        ),
        body: SymptomChecker(), // Symptom checker added here
      ),
    );
  }
}

// Symptom Checker Widget
class SymptomChecker extends StatefulWidget {
  @override
  _SymptomCheckerState createState() => _SymptomCheckerState();
}

class _SymptomCheckerState extends State<SymptomChecker> {
  final TextEditingController _controller = TextEditingController();
  String diagnosis = "";

  void _checkSymptoms(String symptoms) {
  setState(() {
    // Hardcoded symptom checker logic with more conditions
    if (symptoms.toLowerCase().contains("fever")) {
      diagnosis = "Diagnosis: Flu\nMedications: Tamiflu, Relenza\nAdvice: Rest and drink plenty of fluids.";
    } else if (symptoms.toLowerCase().contains("headache")) {
      diagnosis = "Diagnosis: Migraine\nMedications: Ibuprofen, Acetaminophen\nAdvice: Rest in a dark room.";
    } else if (symptoms.toLowerCase().contains("cough")) {
      diagnosis = "Diagnosis: Common Cold\nMedications: Cough Syrup, Dextromethorphan\nAdvice: Stay hydrated and rest.";
    } else if (symptoms.toLowerCase().contains("sore throat")) {
      diagnosis = "Diagnosis: Strep Throat\nMedications: Penicillin, Amoxicillin\nAdvice: Gargle with warm salt water.";
    } else if (symptoms.toLowerCase().contains("nausea")) {
      diagnosis = "Diagnosis: Food Poisoning\nMedications: Pepto-Bismol, Hydration\nAdvice: Avoid solid foods for a few hours.";
    } else if (symptoms.toLowerCase().contains("fatigue")) {
      diagnosis = "Diagnosis: Anemia\nMedications: Iron Supplements\nAdvice: Increase iron-rich foods in your diet.";
    } else if (symptoms.toLowerCase().contains("shortness of breath")) {
      diagnosis = "Diagnosis: Asthma\nMedications: Inhaler (Albuterol)\nAdvice: Avoid allergens and triggers.";
    } else if (symptoms.toLowerCase().contains("chest pain")) {
      diagnosis = "Diagnosis: Heart Attack\nMedications: Aspirin (Emergency), Nitroglycerin\nAdvice: Seek immediate medical attention.";
    } else if (symptoms.toLowerCase().contains("diarrhea")) {
      diagnosis = "Diagnosis: Gastroenteritis\nMedications: Loperamide, Oral Rehydration Solution\nAdvice: Stay hydrated and avoid dairy.";
    } else if (symptoms.toLowerCase().contains("rash")) {
      diagnosis = "Diagnosis: Allergic Reaction\nMedications: Antihistamines (Benadryl)\nAdvice: Avoid the allergen and seek medical care if severe.";
    } else if (symptoms.toLowerCase().contains("joint pain")) {
      diagnosis = "Diagnosis: Arthritis\nMedications: Ibuprofen, Naproxen\nAdvice: Exercise regularly and maintain a healthy weight.";
    } else {
      diagnosis = "Diagnosis not found. Please see a doctor for further evaluation.";
    }
  });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Enter your symptoms:",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Type symptoms here...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _checkSymptoms(_controller.text);
            },
            child: Text("Check Diagnosis"),
          ),
          SizedBox(height: 20),
          Text(
            diagnosis,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}