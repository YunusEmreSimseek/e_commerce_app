import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/constant/text_field_decoration_enums.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.padding.normal,
        child: Column(children: [
          context.sized.emptySizedHeightBoxNormal,
          const TitleText(text: StringConstant.generalWelcome),
          context.sized.emptySizedHeightBoxLow,
          const SubtitleText(text: StringConstant.loginContent),
          context.sized.emptySizedHeightBoxNormal,
          Column(children: [
            LoginAndRegisterTextField(decoration: TextFieldDecorationEnums.email.decoration),
            context.sized.emptySizedHeightBoxLow,
            LoginAndRegisterTextField(
              decoration: TextFieldDecorationEnums.password.decoration,
              isPassword: true,
            ),
            context.sized.emptySizedHeightBoxNormal,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubtitleText(text: 'Forgot ?'),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: context.padding.low,
                      child: const TitleText(text: 'Login'),
                    )),
              ],
            )
          ])
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginAndRegisterTextField extends StatelessWidget {
  const LoginAndRegisterTextField({
    super.key,
    this.isPassword = false,
    required this.decoration,
  });
  final bool isPassword;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        hintText: decoration.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: decoration.prefixIcon,
        suffix: isPassword
            ? InkWell(
                onTap: () => {},
                child: const Icon(Icons.remove_red_eye),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(context.border.normalRadius)),
      ),
    );
  }
}
