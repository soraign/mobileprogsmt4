import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormUI2 extends StatelessWidget {
  final Map? data;
  final CollectionReference _colRef = FirebaseFirestore.instance.collection('Data');

  FormUI2(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {};


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 64, 94),
        title: Text('Masukkan Data Mahasiswa'),
        ),
        
     body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(32),
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgform.png"),
          fit: BoxFit.cover,
      
        ),
      ),
     
      //Form 

      child: Center(
        //card form
        child: Card(
          elevation: 5.0,
          shadowColor: Colors.black,
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: 330, height: 60,
                  margin: EdgeInsets.all(10),
                child : TextFormField(
                  controller: TextEditingController(text: this.data?['nama'] ??''),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Lengkap.',
                    labelText: 'Nama Mahasiswa',
                    icon: Icon(Icons.perm_contact_calendar),
                    
                    
                    border: OutlineInputBorder()),
                    
                    onChanged: (s){
                      data['nama']= s;
                    
                    },
                  ),
                ),
                Container(
                  width: 330, height: 60,
                  margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: TextEditingController(text: this.data?['nim'] ??''),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nim.',
                    labelText: 'Nim',
                    icon: Icon(Icons.numbers),
                    border: OutlineInputBorder()),
                    onChanged: (s){
                      data['nim']= s;
                    
                    },
                  ),
                ),
        
                  
                Container(
                  width: 330, height: 60,
                  margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: TextEditingController(text: this.data?['kelas'] ??''),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Kelas',
                    labelText: 'Kelas',
                    icon: Icon(Icons.sensor_door),
                    border: OutlineInputBorder()),
                    onChanged: (s){
                      data['kelas']= s;
                    
                    },
                  ),
                ),
        
                  Container(
                  width: 330, height: 60,
                  margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: TextEditingController(text: this.data?['nohp'] ??''),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nomor Handphone Aktif',
                    labelText: 'No Hp',
                    icon: Icon(Icons.phone_iphone),
                    border: OutlineInputBorder()),
                    onChanged: (s){
                      data['nohp']= s;
        
                    }
                ),
                  ),
                  
                
                ElevatedButton(onPressed: (){
                  if(this.data != null){
                    _colRef.doc(this.data!['nim']).update(data).then((_){
                      Navigator.pop(context);
                    });
                  }else{
        
                  
                  _colRef.doc(data['nim']).set(data).then((_) {
                    Navigator.pop(context);
        
                  });
                  }
        
                }, child: Text('Simpan Data')
                
                ),
              ],
            ),
            ),
        ),
      ),
    ));
    
    
// Form

  }
}