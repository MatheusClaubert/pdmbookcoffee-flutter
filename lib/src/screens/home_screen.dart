import 'package:app/src/screens/anotations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE99A01),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          child: Icon(
            Icons.exit_to_app_outlined,
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnotationsScreen()),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Anotações',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.bookmark_added_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.6,
                      shrinkWrap: true,
                      semanticChildCount: 2,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/src/assets/livro_1.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Livro 1',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/src/assets/livro_2.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Livro 3',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/src/assets/livro_3.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Livro 5',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/src/assets/livro_1.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Livro 3',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/src/assets/livro_2.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Livro 7',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
