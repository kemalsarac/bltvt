import '../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
    this.text,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // static final _textKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void dismissKeyboard() {
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 36.scaleByHeight(),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        // key: _textKey,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.search, color: style.color),
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }
}
