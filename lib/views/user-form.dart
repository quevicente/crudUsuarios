import 'package:AP2DM/models/user.dart';
import 'package:AP2DM/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['email'] = user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    loadFormData(user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();
                if (isValid) {
                  _form.currentState.save();
                  Provider.of<Users>(context, listen: false).put(User(
                      id: _formData['id'],
                      nome: _formData['nome'],
                      email: _formData['email']));
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 3) {
                    return "Nome inválido";
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['nome'] = value;
                },
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 3) {
                    return "E-mail inválido";
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['email'] = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
