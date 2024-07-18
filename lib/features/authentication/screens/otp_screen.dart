import 'package:ahramgo/components/custom_number_text_form_field.dart';
import 'package:ahramgo/components/main_button.dart';
import 'package:ahramgo/components/title_of_text_form_field.dart';
import 'package:ahramgo/core/constants/colors.dart';
import 'package:ahramgo/core/local/shared_preferences.dart';
import 'package:ahramgo/core/utils/styles.dart';
import 'package:ahramgo/cubits/auth_cubit/cubit.dart';
import 'package:ahramgo/cubits/auth_cubit/states.dart';
import 'package:ahramgo/features/home/data/presentation/views/home_view.dart';
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "عوده",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF007AFF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      const Text(
                        'التسجيل',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * .03,
                  ),
                  const Text('Ahram GO مرحبا بك في', style: Styles.textstyle20),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    ' قمنا بارسال ٦ ارقام لك عبر الواتس اب علي رقم  ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${SharedPreferencesHelper.savedPhone}',
                    style: const TextStyle(
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
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'الرمز غير صحيح';
                        }
                        return null;
                      },
                      controller: otpController,
                      labelText: 'ادخل الرمز',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Homeview(),
                                ));
                          } else if (state is LoginFailureState) {
                            // Handle login failure
                            print(state.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is RegisterLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          return GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final otpCode = otpController.text.trim();
                                context.read<RegisterCubit>().loginOTP(otpCode);
                              }
                              // GoRouter.of(context).push(Routes.kHomePage);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MainButton(
                                color: mainColor,
                                text: "تسجيل الدخول",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    final otpCode = otpController.text.trim();
                                    context
                                        .read<RegisterCubit>()
                                        .loginOTP(otpCode);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          " اعد الارسال",
                          style: Styles.textstyle16.copyWith(
                            color: const Color(0xFF124CA1),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "لم تحصل علي كود؟",
                          style: Styles.textstyle16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
