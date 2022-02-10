import 'package:app/src/services/app_navigator.dart';
import 'package:app/src/views/register_viewmodel.dart';
import 'package:app/src/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (_, provider, child) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('lib/src/assets/prefix_email.jpg'),
                  Expanded(
                    child: TextField(
                      onChanged: provider.setEmail,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('lib/src/assets/prefix_password.jpg'),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      onChanged: provider.setPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('lib/src/assets/prefix_password.jpg'),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      onChanged: provider.setPasswordConfirm,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: provider.isValid
                    ? () async {
                        var user = await provider.register();

                        if (user != null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        } else {
                          AppNavigator.snackBar(
                              SnackbarWidget(title: provider.error));
                        }
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0XFFE99A01),
                  ),
                  child: provider.isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    'Have Account ? Login',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF1877F2),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
