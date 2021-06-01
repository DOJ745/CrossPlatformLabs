import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb10/model/DeepHouseTrack.dart';

void main() {
  test('TRACK from Firestore', () async {

    final instance = MockFirestoreInstance();

    await instance.collection('tracks').add({
      'id': 123,
      'name': "TEST TRACK",
      'lengthInMinutes': "4:00"
    });

    final snapshot = await instance.collection('tracks').get();
    DeepHouseTrack testTrack = DeepHouseTrack.fromDoc(snapshot.docs.first);

    expect(testTrack.id, 123);

  });
}