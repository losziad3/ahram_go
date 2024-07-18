import 'package:ahramgo/components/custom_number_text_form_field.dart';
import 'package:ahramgo/core/utils/routes.dart';
import 'package:ahramgo/core/utils/styles.dart';
import 'package:ahramgo/cubits/auth_cubit/cubit.dart';
import 'package:ahramgo/cubits/auth_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahramgo/components/main_button.dart';
import 'package:ahramgo/components/title_of_text_form_field.dart';
import 'package:ahramgo/core/constants/colors.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 18.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'التسجيل',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  const Text(
                    'Ahram GO مرحبا بك في ',
                    style: Styles.textstyle20,
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  // Phone Number
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleOfTextFormField(
                          textScaleFactor: textScaleFactor,
                          text: 'رقم الهاتف',
                        ),
                      ],
                    ),
                  ),
                  NumberInputField(
                    maxLength: 11,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return 'رقم الموبايل غير صحيح';
                      }
                      return null;
                    },
                    controller: phoneController,
                    labelText: 'ادخل رقم الهاتف',
                  ),
                  // Button
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.response.message),
                        ));
                        // Pass the phone number as an extra parameter
                        GoRouter.of(context).push(
                          Routes.kOTPScreen,
                          extra: phoneController.text,
                        );
                      } else if (state is RegisterFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Error: ${state.error}'),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return const CircularProgressIndicator();
                      }

                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: MainButton(
                            color: mainColor,
                            text: "تسجيل الدخول",
                            onTap: () {
                              // Close the keyboard
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                final phone = phoneController.text.trim();
                                context.read<RegisterCubit>().register(phone);
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
