import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  MyCustomDialog(context, message) async {
    CoolAlert.show(
        widget: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text('$message')],
          ),
        ),
        context: context,
        width: 300,
        type: CoolAlertType.info);
  }

  // LOADING SPINNER :
  StartLoading() {
    var dialog = SmartDialog.showLoading(
        background: Colors.white,
        maskColorTemp: Color.fromARGB(146, 252, 250, 250),
        widget: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.orangeAccent,
        ));
    return dialog;
  }

  // END LOAIDNG  :
  EndLoading() async {
    SmartDialog.dismiss();
  }

  ////////////////////////////////////////
  /// SUBMIT FORM :
  /// 1. GET EAMIL AND PASSWORD [VALIDATE]
  /// 2. START LOGIN PROCESS :
  ////////////////////////////////////////
  SubmitLofinForm() async {
    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
      String email = _formKey.currentState!.value['email'];
      String password = _formKey.currentState!.value['password'];
      // Test
      print('user email $email');
      print('user password $password');
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.width * 1,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 1. EMAIL FIELD
                      Label('Email addresss'),
                      EmailInputField(context),

                      // 2. PASSWORD
                      Label('Password'),
                      PasswodInputField(
                        context,
                      ),
                      // 3.LOOGIN BUTTON:
                      LoginButton(SubmitLofinForm),
                    ]),
              )),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                  buttonType: ButtonType.google, onPressed: () {}),
              SignInButton.mini(
                  buttonType: ButtonType.facebook, onPressed: () {})
            ],
          ))
        ],
      )),
    );
  }

/////////////////////////////////////////
  /// EXTERNAL METHODS :
/////////////////////////////////////////
  // Login Button :
  Container LoginButton(SubmitLofinForm) {
    return Container(
        width: 270,
        height: 42,
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
            onPressed: () {
              SubmitLofinForm();
            },
            child: Text('Login')));
  }

  // Take Password Input :
  FormBuilderTextField PasswodInputField(
    BuildContext context,
  ) {
    return FormBuilderTextField(
      name: 'password',
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.minLength(context, 8,
            errorText: 'invalid password')
      ]),
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
          hintText: 'enter password',
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.lock_rounded,
            color: Colors.orange.shade300,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1.5, color: Colors.teal.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
              )),
          // errorText: 'invalid email address',
          // constraints: BoxConstraints(),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  // Take Email Input :
  FormBuilderTextField EmailInputField(
    BuildContext context,
  ) {
    return FormBuilderTextField(
      name: 'email',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.email(context, errorText: 'enter valid email')
      ]),
      decoration: InputDecoration(
          hintText: 'enter mail ',
          hintStyle: TextStyle(
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Colors.orange.shade300,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1.5, color: Colors.teal.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
              )),
          // errorText: 'invalid email address',
          // constraints: BoxConstraints(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  // Labels of input field :
  Container Label(title) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black)),
    );
  }
}
