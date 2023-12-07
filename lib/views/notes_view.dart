import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          CustomTextField(),
        ],
      ),
    );
  }
}
