
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/auth_repository.dart';
import '../data/notes_repository.dart';
import '../models/note.dart';
import 'add_note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key, required this.uid});

  final String uid;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late final Stream<List<Note>> _notes =
      context.read<NotesRepository>().watchNotes(widget.uid);

  Future<void> _add() async {
    final repository = context.read<NotesRepository>();
    final messenger = ScaffoldMessenger.of(context);

    final result = await showDialog<(String, String)>(
      context: context,
      builder: (_) => const AddNoteDialog(),
    );

    if (result == null) return;

    try {
      await repository.addNote(
        widget.uid,
        result.$1,
        result.$2,
      );
    } on ArgumentError {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('A title is required.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    final notesRepository = context.read<NotesRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            icon: const Icon(Icons.logout),
            onPressed: () => authRepository.signOut(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add note',
        onPressed: _add,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Note>>(
        stream: _notes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Could not load notes.'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final notes = snapshot.data!;

          if (notes.isEmpty) {
            return const Center(
              child: Text('No notes yet'),
            );
          }

          return ListView(
            children: notes.map((note) {
              return Dismissible(
                key: ValueKey(note.id),
                onDismissed: (_) {
                  notesRepository.deleteNote(
                    widget.uid,
                    note.id,
                  );
                },
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.body),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
