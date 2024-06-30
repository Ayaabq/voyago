import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';

import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_cubit.dart';

class FormRegister extends StatelessWidget {
  FormRegister({
    super.key,
  });

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldCustom(
            controller: usernameController,
            hint: "User name",
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.user),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 12),
          TextFieldCustom(
            controller: emailController,
            hint: "Email",
            onPressedIcon: () {},
            icon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          // TextFieldCustom(
          //   hint: "Phone",
          //   onPressedIcon: () {},
          //   icon: const Icon(
          //     Icons.phone_outlined,
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          //const SizedBox(height: 12),
          TextFieldCustom(
            controller: passwordController,
            hint: "Password",
            onPressedIcon: () {},
            icon: const Icon(Icons.remove_red_eye_outlined),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: 12),
          TextFieldCustom(
            controller: confirmPasswordController,
            hint: "confirm password",
            onPressedIcon: () {},
            icon: const Icon(Icons.visibility_off_outlined),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          ButtonAuth(
            title: "Sign up",
            //   onTap: () {
            //     if (formKey.currentState!.validate()) {}
            //     // RegisterModel useracuint = RegisterModel(
            //     //     username: usernameController.text,
            //     //     email: emailController.text,
            //     //     password: passwordController.text,
            //     //     confirmPassword: confirmPasswordController.text);

            //                 final cubit = context.read<RegisterCubit>();
            //                 cubit.featchRegister();

            //  //   BlocProvider.of<RegisterCubit>(context).featchRegister();

            // GoRouter.of(context)
            //     .pushReplacement(AppRouter.kVerificationSginUpView);
            //    },
            onTap: () {
              // Trigger the registration process
              // final cubit = context.read<RegisterCubit>();
              // cubit.featchRegister(
              //   usernameController.text,
              //  emailController.text,
              //  passwordController.text,
              //   confirmPasswordController.text,
              // );

              print('Username: ${usernameController.text}');
              print('Email: ${emailController.text}');
              print('Password: ${passwordController.text}');
              print('Confirm Password: ${confirmPasswordController.text}');
              // BlocProvider.of<RegisterCubit>(context).featchRegister(
              //     usernameController.text,
              //     emailController.text,
              //     passwordController.text,
              //     confirmPasswordController.text);

//777

              final registerModel = RegisterModel(
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
                confirmPassword: confirmPasswordController.text,
              );
              context.read<RegisterCubit>().featchRegister(registerModel);
// فثسف
              // GoRouter.of(context).pushReplacement(
              //   AppRouter.kVerificationSginUpView,

//55555
              // extra: {
              //   usernameController,
              //   emailController,
              //   passwordController,
              //   confirmPasswordController
              // },
              //  );
            },
          ),
        ],
      ),
    );
  }
}
