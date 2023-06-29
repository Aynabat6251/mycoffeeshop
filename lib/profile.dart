import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formfield = GlobalKey<_ProfileState>();
  final numControllor = TextEditingController();
  final passControllor = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF212325),
        body: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(
              children: [
                SizedBox(height: 12,),
                   Text(
                    "Profil",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
               
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        controller: numControllor,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          labelStyle: TextStyle(
                            color: Colors.white
                          ),
                          border: OutlineInputBorder(
                          ),
                          prefixText: "+993",
                          prefixStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                       enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        controller: passControllor,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                            color: Colors.white
                          ),
                           focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                       enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility 
                                  : Icons.visibility_off,color: Colors.white,),
                            ),
                            ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
