import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/components/constants.dart';
import 'package:shop_app/layout/layout.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/screens/register/shop_register_cubit/register_cubit.dart';
import 'package:shop_app/screens/register/shop_register_cubit/states.dart';
import 'package:shop_app/shared/network/remote/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  var Formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.shopModel.status!) {
              print(state.shopModel.message);
              print(state.shopModel.data!.token);
              CacheHelper.saveData(
                      key: 'token', value: state.shopModel.data!.token)
                  .then((value) {
                token = state.shopModel.data!.token!;
                navigateAndFinish(context, ShopLayout());
              });
            } else {
              print(state.shopModel.message);
              showToast(
                  text: state.shopModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Form(
                key: Formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Register',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Register now to browse our hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your Name ';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        label: const Text('Name'),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your Phone Number';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        label: const Text('Phone Address'),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your Email Address';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        label: const Text('Email Address'),
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password is too short';
                        }
                      },
                      obscureText: ShopRegisterCubit.get(context).isPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            onPressed: () {
                              ShopRegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            icon: ShopRegisterCubit.get(context).isPassword
                                ? const Icon(
                                    Icons.visibility_outlined,
                                  )
                                : const Icon(Icons.visibility_off_outlined)),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // state is! ShopLoginLoadState
                    state is! ShopRegisterLoadState
                        ? defaultButton(
                            text: 'register',
                            radius: 20,
                            function: () {
                              if (Formkey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  Email: emailController.text,
                                  Password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You have an account'),
                        defaultTextButton(
                            function: () {
                              navigateAndFinish(context, ShopLoginScreen());
                            },
                            text: 'Login'),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
