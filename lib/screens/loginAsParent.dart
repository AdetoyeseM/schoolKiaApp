import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:schoolkia/widget/bezeirContainer.dart';

// ignore: must_be_immutable
class ParentLogin extends StatefulWidget {
  ParentLogin({Key key, this.title}) : super(key: key);

  final String title;
  String email = ' ';

  String password = '';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<ParentLogin>  {
  bool _obscureText = true;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Form(
          child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          TextFormField(
            validator: (val) =>
                val.isEmpty ? 'Enter a Valid Email Address' : null,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black87),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.blue[300]),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.blue[300]),
                labelText: 'Phone Number',
                 
                 )),
            // onChanged: (val) {

            //   setState(() => email = val);
            // }
        
          SizedBox(
            height: 20,
          ),
          TextFormField(
            maxLength: 12,
            validator: (val) =>
                val.length < 6 ? 'Password must be greater than six' : null,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87),
            decoration: InputDecoration(
                suffixIcon: new GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: new Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue[300] ,
                    )),
                prefixIcon: Icon(Icons.lock, color: Colors.blue[300]),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.blue[300]),
                labelText: 'Password',
               ),
            obscureText: _obscureText,
            // onChanged: (val) {
            //   setState(() => password = val);
            // }),
          )
        ],
      )),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue[100], Colors.blue[300]])),
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5),
      ),
    );
  }
 
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Parent',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 20,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue[300],
          ),
          children: [
            // TextSpan(
            //   text: 'Parent',
            //   style: TextStyle(color: Colors.back54, fontSize: 30),
            // ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                  color: Colors.black87, fontSize: 20, letterSpacing: 2.0),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _form(),
                  SizedBox(height: 20),
                  _submitButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  // _divider(),
                  // _facebookButton(),
                  SizedBox(height: 5),
                  // _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
