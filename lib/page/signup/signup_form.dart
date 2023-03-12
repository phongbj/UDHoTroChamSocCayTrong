import 'package:chamsoccaytrong/page/signup/verify/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../constants/app_styles.dart';
import '../../constants/function/loading_animation.dart';
import '../../constants/function/route_function.dart';
import '../../models/user.dart';
import '../login/login_page.dart';
import '../login/widget/custom_button.dart';
import '../login/widget/input_password.dart';
import '../login/widget/input_text.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/singup_state.dart';
import 'gender_widget.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime birthday = DateTime.now();
  bool hide = true;
  bool gender = true;
  bool check = true;

  @override
  void dispose() {
    _nameController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        if (state is SignupSuccessState && check) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: ("create-account-success"));
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pushReplacement(
                createRoute(screen: const VerifyPage()),
              );
            });
          });
        }

        if (state is SignupErrorState && check) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: (state.status));
        }
        check = true;

        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Text(
                    ('hello_new_user'),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ('welcome_to_app'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 50),
                  InputText(
                    hint: ('full_name'),
                    validator: 1,
                    controller: _nameController,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 20),
                  InputText(
                    hint: "Email",
                    validator: 0,
                    controller: _userController,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Spacer(),
                      GenderWidget(
                          currentGender: gender,
                          gender: true,
                          action: () {
                            if (!gender) {
                              check = false;
                              setState(() => gender = true);
                            }
                          }),
                      const Spacer(),
                      GenderWidget(
                          currentGender: gender,
                          gender: false,
                          action: () {
                            if (gender) {
                              check = false;
                              setState(() => gender = false);
                            }
                          }),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: birthday,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != birthday) {
                        check = false;
                        setState(() => birthday = picked);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 20),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 57,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("dd/MM/yyyy").format(birthday),
                            style: AppStyles.p,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 25,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputPassword(
                    action: () {
                      check = false;
                      setState(() => hide = !hide);
                    },
                    hint: ('password'),
                    controller: _passwordController,
                    hide: hide,
                  ),
                  const SizedBox(height: 20),
                  InputPassword(
                    action: () {
                      check = false;
                      setState(() => hide = !hide);
                    },
                    hint: ('confirm_password'),
                    controller: _confirmPasswordController,
                    password: _passwordController,
                    hide: hide,
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        loadingAnimation(context);
                        BlocProvider.of<SignupBloc>(context).add(
                          SignupEmailPasswordEvent(
                            email: _userController.text.trim(),
                            password: _passwordController.text,
                            user: User(
                              name: _nameController.text.trim(),
                              money: 0,
                              birthday:
                              DateFormat("dd/MM/yyyy").format(birthday),
                              gender: gender,
                              avatar: "",
                            ),
                          ),
                        );
                        return;
                      }
                    },
                    text: ('sign_up'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ('have_account'),
                        style: AppStyles.p,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            createRoute(screen: const LoginPage()),
                          );
                        },
                        child: Text(
                          ('login_now'),
                          style: AppStyles.p,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
