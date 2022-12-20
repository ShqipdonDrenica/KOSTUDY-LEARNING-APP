import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.callBackClear,
      this.isPrefixIconVisible = false,
      required this.callBackSearch,
      required this.callBackPrefix,
      required this.hintText,
      required this.onChanged,
      this.prefixText = '',
      this.count})
      : super(key: key);
  final TextEditingController textEditingController;
  final ValueChanged onChanged;
  final VoidCallback callBackClear, callBackPrefix, callBackSearch;
  final bool isPrefixIconVisible;
  final String hintText;
  final String? prefixText;
  final int? count;
  // final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 52,
      child: TextFormField(
        // onTap: () => {
        //   count!,
        // },
        cursorColor: Colors.grey,
        controller: textEditingController,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 8.0,
            ),
            child: prefixText == ''
                ? const Icon(Icons.edit)
                : Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(prefixText!),
                  ),
          ),
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
          contentPadding: const EdgeInsets.only(left: 20),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
