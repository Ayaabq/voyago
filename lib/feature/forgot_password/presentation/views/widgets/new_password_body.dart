import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';

import '../../../../../core/utils/validator_manager.dart';
import '../../manger/restPassword/rest_password_cubit.dart';

class NewPasswordBody extends StatelessWidget {
  NewPasswordBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestPasswordCubit, RestPasswordState>(
        listener: (context, state) {
      if (state is RestPasswordLoading) {
        context.showLoadingToast();
      } else if (state is RestPasswordSuccess) {
        // context.showSuccessToast(state.message);
        GoRouter.of(context).pushReplacement(AppRouter.kSuccessPasswor);
      } else if (state is RestPasswordFailure) {
        context.showFailureToast(state.errorMessage);
      }
    }, builder: (context, state) {
      return ListView(
        children: [
          Column(
            children: [
              const HeaderAuth(
                  imageUrl: LoginAssets.newpassword,
                  padding: EdgeInsets.only(top: 60)),
              const SizedBox(height: 20),
              Padding(
                padding: kPaddingHoriz24,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Create new password",
                        style: Styles.textStyle25W700,
                      ),
                      const SizedBox(height: 38),
                      TextFieldCustom(
                          controller: emailController,
                          hint: "Email",
                          onPressedIcon: () {},
                          icon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              ValidatorManager().validateEmail(value!)),
                      const SizedBox(height: 16),
                      TextFieldCustom(
obscureText: false,
                        controller: passwordController,
                        hint: "password",
                        onPressedIcon: () {},
                        icon: const Icon(Icons.visibility_off_outlined),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            ValidatorManager().validatePassword(value!),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .26),
                      ButtonAuth(
                          title: "Reset Password",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<RestPasswordCubit>()
                                  .featchRestPassword(emailController.text,
                                      passwordController.text);
                            }

                            // GoRouter.of(context)
                            //     .pushReplacement(AppRouter.kSuccessPasswor);
                          }),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }
}
