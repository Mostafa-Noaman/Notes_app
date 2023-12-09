import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

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
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                validation = AutovalidateMode.always;
                setState(() {});
              }
              print(title);
              print(content);
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
