import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/providers/user_provider.dart';
import 'package:form_validation/src/utils/selloria_icon_icons.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class LoginPage extends StatelessWidget {

  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_buildBackground(context), _loginForm(context)],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final purpleBg = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        purpleBg,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle),
        Positioned(bottom: 120.0, right: 20.0, child: circle),
        Positioned(bottom: -50.0, left: -20.0, child: circle),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Icon(SelloriaIcon.money_bag, color: Colors.white, size: 60.0),
              SizedBox(height: 1.0, width: double.infinity),
              Text(
                'Selloria',
                style: TextStyle(color: Colors.white, fontSize: 50.0, fontFamily: 'DancingScript'),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 160,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 1.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                _buildEmail(bloc),
                SizedBox(height: 15.0),
                _buildPassword(bloc),
                SizedBox(height: 30.0),
                _buildButton(bloc)
              ],
            ),
          ),
          FlatButton(
            child: Text('Crear una nueva cuenta'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget _buildEmail(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'ejemplo@mail.com',
              labelText: 'Correo electrónico',
              // counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: loginBloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _buildPassword(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contraseña',
              // counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: loginBloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _buildButton(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(context, loginBloc) : null,
        );
      },
    );
  }


  _login(BuildContext context, LoginBloc loginBloc) async {
    
    final info = await userProvider.login(loginBloc.email, loginBloc.password);
    if (info['ok']) {
      userProvider.setLastPage('home');
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      utils.showAlert(context, 'Algo salió mal', info['message']);
    }
  }

}
