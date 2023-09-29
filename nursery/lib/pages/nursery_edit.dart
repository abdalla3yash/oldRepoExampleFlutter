import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/helpers/ensure_visible.dart';
import '../models/nursery.dart';
import '../scoped-models/main.dart';

class NurseryEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NurseryEditPageState();
  }
}

class _NurseryEditPageState extends State<NurseryEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'age': null,
    'bloodType': null,
    'code':null,
    'image': 'assets/baby.png'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _codeFocusNode = FocusNode();
  final _bloodTypeFocusNode = FocusNode();


  Widget _buildTitleTextField(Nursery nursery) {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'child name'),
        initialValue: nursery == null ? '' : nursery.title,
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty ) {
            return 'name is required.';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField(Nursery nursery) {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Nursery Description'),
        initialValue: nursery == null ? '' : nursery.description,
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty ) {
            return 'notes is required.';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildageTextField(Nursery nursery) {
    return EnsureVisibleWhenFocused(
      focusNode: _ageFocusNode ,
      child: TextFormField(
        focusNode: _ageFocusNode ,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'child age'),
        initialValue: nursery == null ? '' : nursery.age.toString(),
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'age should be a number.';
          }
        },
        onSaved: (String value) {
          _formData['age'] = value;
        },
      ),
    );
  }

  Widget _buildBloodTypeTextField(Nursery nursery) {
    return EnsureVisibleWhenFocused(
      focusNode: _bloodTypeFocusNode ,
      child: TextFormField(
        focusNode: _bloodTypeFocusNode ,
        decoration: InputDecoration(labelText: 'bloodType of child'),
        initialValue: nursery == null ? '' : nursery.bloodType.toString(),
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty) {
            return 'bloodType is nessecary!';
          }
        },
        onSaved: (String value) {
          _formData['bloodType'] = value;
        },
      ),
    );
  }

  Widget _buildCodeTextField(Nursery nursery) {
    return EnsureVisibleWhenFocused(
      focusNode: _codeFocusNode,
      child: TextFormField(
        focusNode: _codeFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'room code'),
        initialValue: nursery == null ? '' : nursery.code.toString(),
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length != 4 ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'code must be only 4 numbers';
          }
        },
        onSaved: (String value) {
          _formData['code'] = value;
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: () => _submitForm(
                    model.addNursery,
                    model.updateNursery,
                    model.selectNursery,
                    model.selectedNurseryIndex),
              );
      },
    );
  }

  Widget _buildPageContent(BuildContext context,Nursery nursery) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(nursery),
              _buildDescriptionTextField(nursery),
              _buildageTextField(nursery),
              _buildCodeTextField(nursery),
              _buildBloodTypeTextField(nursery),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.green,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text('My Button'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(
      Function addNursery, Function updateNursery, Function setSelectedNursery,
      [int selectedNurseryIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedNurseryIndex == -1) {
      addNursery(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['age'],
        _formData['bloodType'],
        _formData['code'],
      ).then((bool success) {
        if (success) {
          Navigator
              .pushReplacementNamed(context, '/nurseries')
              .then((_) => setSelectedNursery(null));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Something went wrong'),
                  content: Text('Please try again!'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Okay'),
                    )
                  ],
                );
              });
        }
      });
    } else {
      updateNursery(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['age'],
        _formData['bloodType'],
        _formData['code'],
      ).then((_) => Navigator
          .pushReplacementNamed(context, '/nurseries')
          .then((_) => setSelectedNursery(null)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedNursery);
        return model.selectedNurseryIndex == -1
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Nursery'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
