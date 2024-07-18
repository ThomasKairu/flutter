// ignore_for_file: use_build_context_synchronously

import 'package:angel_fetus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Registry extends StatefulWidget {
  const Registry({super.key});

  @override
  State<Registry> createState() => _RegistryState();
}

class _RegistryState extends State<Registry> {
  bool _signUp = false;
  bool _loading = false;
  bool _passwordVisibility = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  Future<void> attemptSignUp() async {
      final isValid = _formKey.currentState?.validate();
      if (isValid != true) {
        return;
      }
      setState(() {
        _loading = true;
      });
      try {
        final signUpResponse = await supabase.auth.signUp(
          email: _emailController.text,
          password: _passwordController.text,
        );

        if (signUpResponse.user != null) {
          _showSuccessSnackBar(context, 'Successful, Confirm your email');
        } else {
          _showErrorSnackBar(context, 'Sign-Up Failed');
        }
      } on Exception catch (e) {
        _showErrorSnackBar(context, 'Sign-Up Failed: ${e.toString()}');
      } catch (e) {
        _showErrorSnackBar(context, 'Sign-Up Failed');
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }

  Future<void> _attemptSignIn() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) {
      return;
    }
    setState(() {
      _loading = true;
    });
    try {
      final signInResponse = await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (signInResponse.user != null) {
        _showSuccessSnackBar(context, 'Login Successful');
        Navigator.pushReplacementNamed(context, AppRoutes.initPage);
      } else {
        _showErrorSnackBar(context, 'Sign-In Failed');
      }
    } on Exception catch (e) {
      _showErrorSnackBar(context, 'Sign-In Failed: ${e.toString()}');
    } catch (e) {
      _showErrorSnackBar(context, 'Sign-In Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_signUp)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29, vertical: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill in a name';
                        }
                        return null;
                      },
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your Full Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in an email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _passwordVisibility = !_passwordVisibility,
                        ),
                        child: Icon(
                          _passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: !_passwordVisibility,
                  ),
                ),
                if (_signUp)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      controller: _passwordConfirmationController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _passwordVisibility = !_passwordVisibility,
                          ),
                          child: Icon(
                            _passwordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: !_passwordVisibility,
                    ),
                  ),
                _loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: OutlinedButton(
                          onPressed: () {
                            if (_signUp) {
                              attemptSignUp();
                            } else {
                              _attemptSignIn();
                            }
                          },
                          child: Text(_signUp ? 'Sign Up' : 'Sign In'),
                        ),
                      ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _signUp = !_signUp;
                    });
                  },
                  child: Text(_signUp
                      ? 'Already have an account? Sign In'
                      : 'Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
