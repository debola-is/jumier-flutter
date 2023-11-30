import 'dart:developer' show log;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/common/widgets/custom_text_field.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/services/auth_services.dart';

class SignInScreen extends StatefulWidget {
  /// [authServiceLoading] is used as a checker which returns true or false is
  /// there is a network request function currently being executed in the
  /// foreground
  ///
  /// [_createNewAccount] is used as a checker and used to set the state to a
  /// login state or signup state based on users choice.
  /// Default however, is login.
  /// UI components vary based on the state.

  static const routeName = "/user/signin";
  static bool authServiceLoadin = false;
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  bool _authServiceLoading = false;
  bool _createNewAccount = false;
  bool _passwordObscured = true;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  final AuthService _authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  void signInUser() async {
    setState(() {
      _authServiceLoading = true;
    });

    await _authService.signIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _authServiceLoading = false;
    });
  }

  void signUpUser() async {
    setState(() {
      _authServiceLoading = true;
    });

    await _authService.signUp(
        context: context,
        firstName: _firstNameController.text,
        middleName: _middleNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text);

    setState(() {
      _authServiceLoading = false;
      _createNewAccount = false;
    });

    // TODO: Create alert dialog informing user to login with same credentials after signing up.
  }

  void togglePasswordVisibiity() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
  }

  bool validateLoginDetails() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateSignUpDetails() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomNetworkLoadingBarrier(
      isloading: _authServiceLoading,
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Container(
                    color: shadeOfGrey,
                    padding: const EdgeInsets.fromLTRB(30, 150, 30, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _createNewAccount ? "Create A New Account" : 'Login',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _createNewAccount
                              ? "Pleae enter details for your new account"
                              : 'Please sign in to continue',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _signInFormKey,
                          child: Column(
                            children: [
                              if (_createNewAccount)
                                Column(
                                  children: [
                                    CustomTextField(
                                      controller: _firstNameController,
                                      hintText: 'First Name',
                                      inputType: TextInputType.name,
                                      shouldBeElevated: true,
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CustomTextField(
                                      controller: _middleNameController,
                                      hintText: 'Middle Name (optional)',
                                      inputType: TextInputType.name,
                                      shouldBeElevated: true,
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CustomTextField(
                                      controller: _lastNameController,
                                      hintText: 'Last Name',
                                      inputType: TextInputType.name,
                                      shouldBeElevated: true,
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                                inputType: TextInputType.emailAddress,
                                shouldBeElevated: true,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.black38,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                  inputType: TextInputType.visiblePassword,
                                  shouldBeElevated: true,
                                  obscureText: _passwordObscured,
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black38,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: togglePasswordVisibiity,
                                    icon: _passwordObscured
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black38,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: shadeOfOrange,
                                          ),
                                  )),
                              const SizedBox(
                                height: 30,
                              ),
                              if (_createNewAccount)
                                CustomButton(
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                            .validate() &&
                                        validateSignUpDetails()) {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      signUpUser();
                                      log("Sign up button pressed");
                                    } else {
                                      showSnackBar(
                                        context,
                                        'Please supply input to all mandatory fields',
                                        ErrorType.warning,
                                      );
                                    }
                                  },
                                  text: "Create Account",
                                ),
                              if (!_createNewAccount)
                                CustomButton(
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                            .validate() &&
                                        validateLoginDetails()) {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      signInUser();
                                      log("Login button pressed");
                                    } else {
                                      showSnackBar(
                                        context,
                                        'Please supply input to all fields',
                                        ErrorType.warning,
                                      );
                                    }
                                  },
                                  text: "Log In",
                                ),
                              if (!_createNewAccount)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Dont have an account?   ",
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: "Create One",
                                          style: TextStyle(
                                            color: shadeOfOrange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(() {
                                                _passwordController.text = '';
                                                _emailController.text = '';
                                                _createNewAccount = true;
                                              });
                                              _controller.reset();
                                              _controller.forward();
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (_createNewAccount)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Sign In ",
                                      style: TextStyle(
                                        color: shadeOfOrange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            _passwordController.text = '';
                                            _emailController.text = '';
                                            _createNewAccount = false;
                                          });
                                          _controller.reset();
                                          _controller.forward();
                                        },
                                      children: const [
                                        TextSpan(
                                          text: "instead?",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: Icon(
                    Icons.login,
                    size: 100,
                    color: shadeOfOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
