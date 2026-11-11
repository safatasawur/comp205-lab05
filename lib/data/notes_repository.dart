
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note.dart';

class NotesRepository {
  NotesRepository(this._db);

  final FirebaseFirestore _db;

  // Get the notes collection for a specific user.
  CollectionReference<Map<String, dynamic>> _notes(String uid) =>
      _db.collection('users').doc(uid).collection('notes');

  // Get notes in real time, newest first.
  Stream<List<Note>> watchNotes(String uid) {
    return _notes(uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Note.fromFirestore(doc.id, doc.data());
      }).toList();
    });
  }

  // Add a new note.
  Future<void> addNote(
    String uid,
    String title,
    String body,
  ) async {
    final trimmedTitle = title.trim();
    final trimmedBody = body.trim();

    if (trimmedTitle.isEmpty ||
        trimmedTitle.length > 100) {
      throw ArgumentError(
        'Title must be between 1 and 100 characters.',
      );
    }

    final note = Note(
      id: '',
      title: trimmedTitle,
      body: trimmedBody,
    );

    await _notes(uid).add(note.toFirestore());
  }

  // Delete a note.
  Future<void> deleteNote(
    String uid,
    String noteId,
  ) async {
    await _notes(uid).doc(noteId).delete();
  }
}

