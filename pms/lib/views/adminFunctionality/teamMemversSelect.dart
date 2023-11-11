import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamMembersSelection extends StatefulWidget {
  const TeamMembersSelection({super.key});
  @override
  State<TeamMembersSelection> createState() => _TeamMembersSelectionState();
}

class _TeamMembersSelectionState extends State<TeamMembersSelection> {
  Set<int> selectedListTiles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Select team members',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),),
      ),
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 5,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedListTiles.contains(index) ? selectedListTiles.remove(index) : selectedListTiles.add(index);
                            });
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 2,
                            color: selectedListTiles.contains(index) ? Colors.blue : Colors.deepPurpleAccent,
                            child: const ListTile(
                              title: Text('Muhammad Waseem', style: TextStyle(color: Colors.white, fontFamily: 'playFair'),),
                              trailing: Text('Developer', style: TextStyle(color: Colors.white, fontFamily: 'playFair'),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Align(
              alignment: Alignment.bottomRight,
              child: Material(
                child: FloatingActionButton(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child:
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    // TODO: Handle the next button press
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
