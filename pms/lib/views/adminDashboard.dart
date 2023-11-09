import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black87,
        shadowColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Center(child: Text('PMS',style: TextStyle(color: Colors.white,fontFamily: 'playFairItalic'),)),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text('Muhammad Waseem',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),),
                  Text('wyameen152@gmail.com',style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'playFair'),),
                ],
              ),
             
            ), 
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' Assign Project '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white24,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Projects',
                ),
                Tab(
                  text: 'Tasks',
                ),
                Tab(
                  text: 'Teams',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Stack(
                  children: [ 
                    ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                            width: 320,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.0, top: 20),
                                      child: Text(
                                        'Sudoku Game',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'playFair'),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.0, top: 50),
                                      child: Text(
                                        'Cost: 1000',
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 14,
                                            fontFamily: 'playFair'),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.0, top: 85),
                                      child: Text(
                                        'Status: Assigned',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14,
                                            fontFamily: 'playFair'),
                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 8.0, right: 8.0),
                                    child: Icon(
                                      Icons.open_in_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue.shade200,
                          child: Icon(Icons.add),
                          onPressed: (){}),
                      ))
                  ]
                ),
              ),
              Container(
                child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 320,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 20),
                                          child: Text(
                                            'Sudoku Game',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 50),
                                          child: Text(
                                            'Cost: 1000',
                                            style: TextStyle(
                                                color: Colors.greenAccent,
                                                fontSize: 14,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 85),
                                          child: Text(
                                            'Status: Assigned',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 14,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 8.0, right: 8.0),
                                        child: Icon(
                                          Icons.open_in_new,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                                backgroundColor: Colors.blue.shade200,
                                child: Icon(Icons.add),
                                onPressed: (){}),
                          ))
                    ]
                ),
              ),
              Container(
                child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 320,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 20),
                                          child: Text(
                                            'Sudoku Game',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 50),
                                          child: Text(
                                            'Cost: 1000',
                                            style: TextStyle(
                                                color: Colors.greenAccent,
                                                fontSize: 14,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 12.0, top: 85),
                                          child: Text(
                                            'Status: Assigned',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 14,
                                                fontFamily: 'playFair'),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 8.0, right: 8.0),
                                        child: Icon(
                                          Icons.open_in_new,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                                backgroundColor: Colors.blue.shade200,
                                child: Icon(Icons.add),
                                onPressed: (){}),
                          ))
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
