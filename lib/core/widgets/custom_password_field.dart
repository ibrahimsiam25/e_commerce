import 'package:flutter/material.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';

class CustomPasswoerdField extends StatefulWidget {
  const CustomPasswoerdField({
    super.key,
    this.onSaved,
  });
  final void Function(String)? onSaved;

  @override
  State<CustomPasswoerdField> createState() => _CustomPasswoerdFieldState();
}

class _CustomPasswoerdFieldState extends State<CustomPasswoerdField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onSaved: (value) {},
      obscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              )
            : const Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
