import 'package:flutter/material.dart';

class TextFormFieldContactUsWidget extends StatelessWidget {
  const TextFormFieldContactUsWidget(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.onChanged,
      this.maxLines,
      this.count,
      this.validator})
      : super(key: key);
  final TextEditingController textEditingController;
  final ValueChanged onChanged;

  final String hintText;
  final int? maxLines;
  final int? count;
  final Function(String)? validator;
  // final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextFormField(
      validator: (value) => validator!(value!),
      // onTap: () => {
      //   count!,
      // },
      maxLines: maxLines,
      cursorColor: Colors.grey,
      controller: textEditingController,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.bodyText2!.copyWith(
          fontFamily: 'Avenir',
          fontSize: 14,
          color: Colors.black54,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.all(16),
        alignLabelWithHint: true,
      ),
    );
  }
}
