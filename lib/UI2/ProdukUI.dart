import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectsaya/UI2/formui2.dart';

class ListDataUI2 extends StatelessWidget {
  final FirebaseFirestore _ff = FirebaseFirestore.instance;
  late CollectionReference _colRef;

  ListDataUI2({Key? key}) : super(key: key){
  _colRef = _ff.collection('Data');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
      ),


      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>FormUI2(null)));
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
                      return FormUI2(data);
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