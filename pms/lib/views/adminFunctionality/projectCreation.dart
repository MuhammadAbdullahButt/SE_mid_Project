import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/adminFunctionality/projectCrScreen2.dart';

class ProjectCreation extends StatefulWidget {
  const ProjectCreation({super.key});

  @override
  State<ProjectCreation> createState() => _ProjectCreationState();
}

class _ProjectCreationState extends State<ProjectCreation> {
  late String valuechoose;
  DateTime date = DateTime.now();
  List listItem = ['Web', 'Mobile', 'Desktop'];
  void initState() {
    super.initState();
    // Initialize valueChoose with the first item in the list
    valuechoose = listItem[0];
  }

  void _showDatePicker()
  {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2030)
    ).then((value){
      setState(() {
        date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create a new Project',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playFair'),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Project Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Select Type'),
                    icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black87,),
                      value: valuechoose,
                      onChanged: (newvalue) {
                        setState(() {
                          valuechoose = newvalue.toString();
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList()),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(5),
                    ),
                      child: Text("${date.day}-${date.month}-${date.year}",style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
                  ),
                  MaterialButton(
                    onPressed: (){
                      _showDatePicker();
                    },
                    child: Text('Select Deadline',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),),
                    color: Colors.black87,
                  ),
                ],),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 230, top: 50),
                  child: Material(
                    child: FloatingActionButton(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:
                          const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const ProjectCrScreenTwo();
                        }
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
