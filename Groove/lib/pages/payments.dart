import 'package:dm_development/models/payment.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<Payment> _allCities = Payment.allCities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHomePageBody(context),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Expanded(
              child: ListTile(
                title: new Text('Total: '),
                subtitle: new Text('\$580'),
              ),
            ),
            new Expanded(
              child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  'pay all',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(61, 64, 69, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allCities.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new ListTile(
          leading: new Image.asset(
             "assets/"+_allCities[index].image,
            fit: BoxFit.cover,
            width: 100.0,
          ),
          title: Text(_allCities[index].name),
          subtitle: Text(_allCities[index].name),
          trailing: Text(
            _allCities[index].name == "sent" ? "-${_allCities[index].amount}" : "+${_allCities[index].amount}",
            style: TextStyle(
              color:
                  _allCities[index].name == "sent" ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          //trailing: ,
          onTap: () {
            _showSnackBar(context, _allCities[index]);
          },
        )
      ],
    ));
  }

  _showSnackBar(BuildContext context, Payment item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("you are paying ${item.name}"),
      backgroundColor: Color.fromRGBO(61, 64, 69, 1),
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}
