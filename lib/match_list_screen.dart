import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/match_details_screen.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  // DS A
  // DS B
  // Adapter class - A + B => list<data> (Adapter pattern)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          FirebaseFirestore.instance.collection('football').add({
            'match_name': 'my_match',
            'p1': 'sdjf',
            'p2': 'sdjf',
            'goals': '0:0',
            'total_min': '0:0',
            'current_min': '90:00'
          });
          // FirebaseFirestore.instance.collection('football').doc('ksdjfkasdjwe').update({
          //   'match_name': 'my_match',
          //   'p1': 'sdjf',
          //   'p2': 'sdjf',
          //   'goals': '0:0',
          //   'total_min': '0:0',
          //   'current_min': '90:00'
          // });
        },
        label: const Text('Add match'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  final QueryDocumentSnapshot item = snapshot.data!.docs[index];
                  print(snapshot.data!.docs.length);
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchDetailsScreen(
                            matchName: item.get('match_name'),
                            matchId: item.id,
                          ),
                        ),
                      );
                    },
                    title: Text(item.get('p1') + ' vs ' + item.get('p2')),
                    trailing: const Icon(Icons.arrow_forward_outlined),
                  );
                },
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
