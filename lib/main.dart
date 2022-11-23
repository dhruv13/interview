import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    home: add(),
  ));
}

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  String address1 = "";
  String adresstype = "";
  Color c = Colors.white;
  Color c1 = Colors.white;
  Color c2 = Colors.white;
  TextEditingController tmobile = TextEditingController();
  TextEditingController tname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("ADD ADDRESS"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
            child: DropdownButtonFormField<String>(
              hint: Text("Surat Gujarat"),
              onChanged: (value) {
                address1 = value!;
                print(address1);
                setState(() {});
              },
              icon: Icon(Icons.keyboard_arrow_down_outlined),
              items: [
                DropdownMenuItem(value: "Varrachha", child: Text("Varrachha")),
                DropdownMenuItem(value: "udhana", child: Text("udhana")),
                DropdownMenuItem(value: "Kamrej", child: Text("Kamrej")),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20, left: 15, bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Adress Type :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: c,
                ),
                width: 120,
                child: InkWell(
                  child: Text(
                    "Home",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    c = Colors.grey;
                    c1 = Colors.white;
                    c2 = Colors.white;
                    adresstype="Home";
                    setState(() {});
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: c1,
                ),
                width: 120,
                child: InkWell(
                  child: Text(
                    "Office",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    c1 = Colors.grey;
                    c = Colors.white;
                    c2 = Colors.white;
                    adresstype="Office";
                    setState(() {});
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: c2,
                ),
                width: 120,
                child: InkWell(
                  child: Text(
                    "Other",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    c2 = Colors.grey;
                    c = Colors.white;
                    c1 = Colors.white;
                    adresstype="Other";
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Mobile No :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Container(margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: TextField(decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(20),
                )
            ),
              controller: tmobile,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Name :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Container(margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
              )
            ),
              controller: tname,
            ),
          ),
         Container(margin: EdgeInsets.only(top: 80),height: 50,alignment: Alignment.center,
           decoration: BoxDecoration(color: Colors.grey,
             borderRadius: BorderRadius.circular(15)
           ),
           width: 180,
           child: InkWell(
             onTap: () async {
               String mobile=tmobile.text;
               String name=tname.text;
               var url =
               Uri.parse('http://workfordemo.in/bunch3/insert_address.php?gps_address=$address1%20road,%20surat&latitude=21.84444&longitude=72.54445&address_type=$adresstype&mobile=$mobile&name=$name');

               var response = await http.get(url);
               print(response.body);
             },
             child: Text("Sumbit"),
           ),
         ),
        ],
      )),
    );
  }
}
