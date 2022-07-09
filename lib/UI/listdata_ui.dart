import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectsaya/UI/formdata_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListDataUI extends StatelessWidget {
  final FirebaseFirestore _ff = FirebaseFirestore.instance;
  late CollectionReference _colRef;

  ListDataUI({Key? key}) : super(key: key){
  _colRef = _ff.collection('Data');
}
// Appbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 64, 94),
        title: const Text('Daftar Mahasiswa'),
      ),
// AppBar


      backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 24, 83, 131),
        child: const Icon(Icons.person_add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>FormDataUI(null)));
        },),
      body: StreamBuilder<QuerySnapshot>(
        stream: _colRef.snapshots(),
        builder: (c,snap)=>ListView(
          children: [
            for(var d in snap.data?.docs ?? [])
            Builder(builder: (c){
              var data = d.data();
              return Card(
                child: ListTile(
                  onLongPress: (){
                    showCupertinoDialog(context: context, 
                    builder: (c)=>CupertinoAlertDialog(
                      title: const Text('Hapus Data'),
                      content: Text('Ingin menghapus ${data['nama']} dari daftar?'),
                      actions: [
                        CupertinoDialogAction(child: Text('Ya'),
                        onPressed: (){
                          _colRef.doc(data['nim']).delete();
                          Navigator.pop(c);
                        },
                        ),
                        CupertinoDialogAction(child: Text('Tidak'),
                        onPressed: (){
                          Navigator.pop(c);
                        },
                        )
                      ],
                    ));
                  },
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c){
                      return FormDataUI(data);
                    }));
                  },
                  title: Text(
                    '${data['nama']}',
                    style: TextStyle(fontSize: 20)
                  ),
                  subtitle: Text('Nim : ${data['nim']} | Kelas: ${data['kelas']} | No Hp : ${data['nohp']}'),
                  leading: CircleAvatar(
                    child: Text(
                      '${data['nama']}'[0],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
              ),
              );
            }
            
            )
          ],
        )),
    );
  }
}