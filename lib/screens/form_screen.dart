import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  static String formScreen = '\formScreen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Color.fromARGB(
            255,
            120,
            93,
            165,
          ),
          Colors.white12),
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: InkWell(
            
            onHover: (value) {
              setState(() {
                ishover = true;
              });
            },
            child: AnimatedContainer(
               padding: EdgeInsets.only(
              top: (ishover) ? 25 : 30.0, bottom: !(ishover) ? 25 : 30),
              duration: Duration(seconds: 3),
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 197, 219),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 480,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              labelText: 'title', icon: Icon(Icons.title)),
                          keyboardType: TextInputType.text,
                          // The validator receives the text that the user has entered, and use regexed_validator to check if it is a valid string.
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter a valid title';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Url', icon: Icon(Icons.image)),
                    keyboardType: TextInputType.number,
                    // The validator receives the text that the user has entered, and use regexed_validator to check if it is a valid string.
                    validator: (value) {
                      if (value == null || !validator.url(value)) {
                        return 'Please enter a valid url';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'price', icon: Icon(Icons.price_check)),
                    keyboardType: TextInputType.number,
                    // The validator receives the text that the user has entered, and use regexed_validator to check if it is a valid string.
                    validator: (value) {
                      if ((value?.contains(RegExp(r'[a-z]'))) == true) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          clipBehavior: Clip.hardEdge,
                          style: ButtonStyle(alignment: Alignment.topLeft),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
