import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:intl/intl.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validation = AutovalidateMode.disabled;

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: validation,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (val) {
              title = val;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (val) {
              content = val;
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat.yMMMEd().format(now);
                    var noteModel = NoteModel(
                        title: title!,
                        content: content!,
                        date: formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    validation = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
