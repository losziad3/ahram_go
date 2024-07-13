import 'package:ahramgo/components/custom_number_text_form_field.dart';
import 'package:ahramgo/components/main_button.dart';
import 'package:ahramgo/components/title_of_text_form_field.dart';
import 'package:ahramgo/core/constants/colors.dart';
import 'package:ahramgo/cubits/auth_cubit/cubit.dart';
import 'package:ahramgo/cubits/auth_cubit/states.dart';
import 'package:ahramgo/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  const Text(
                    'مرحبا بك في AHRAM GO',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    'قمنا بارسال 6 ارقام عبر الواتس اب علي الرقم ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '(01099682110)',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Text(
                    'لتاكيد عملية التسجيل من فضلك ادخل الارقام',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  // OTP Number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleOfTextFormField(
                          textScaleFactor: textScaleFactor,
                          text: 'ادخل الارقام',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: NumberInputField(
                      maxLength: 6,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 4) {
                          return 'الرمز غير صحيح';
                        }
                        return null;
                      },
                      controller: otpController,
                      labelText: 'ادخل الرمز',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.response.msg),
                            ));
                            print(state.response);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

                          } else if (state is LoginFailureState) {
                            // Handle login failure
                            print(state.error);
                          }
                        },
                        builder: (context, state) {

                          return MainButton(
                            color: mainColor,
                            text: "تسجيل الدخول",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final otpCode = otpController.text.trim();
                                context.read<RegisterCubit>().loginOTP(otpCode);
                              }
                            },
                          );
                        },
                      ),
                    ),
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
/*
* return */