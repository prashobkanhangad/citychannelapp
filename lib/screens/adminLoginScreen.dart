import 'package:city_channel_app/screens/adminhomescreen.dart';
import 'package:city_channel_app/screens/mainscreen.dart';
import 'package:flutter/material.dart';


class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 3, 108),
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const MainScreen()),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Image(
              width: 100,
              image: AssetImage('asset/citylogo.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 235, 233, 246),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 210,
            // ),
            const Text(
              'Admin Login',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 10.0,
                        ),
                        prefixIcon: const Icon(Icons.email,
                            color: Color.fromARGB(255, 12, 3, 108)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 12, 3, 108),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'EMAIL',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 12, 3, 108))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 10.0,
                        ),
                        prefixIcon: const Icon(Icons.vpn_key,
                            color: Color.fromARGB(255, 12, 3, 108)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 12, 3, 108),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'PASSWORD',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 12, 3, 108))),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminHomeScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 12, 3, 108),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255)),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
