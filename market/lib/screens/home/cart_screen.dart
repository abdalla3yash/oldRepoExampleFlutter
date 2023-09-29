import 'package:flutter/material.dart';
import 'package:market/widgets/Custom_button.dart';
import '../../providers/cart.dart' show Cart;
import '../../widgets/cart_item.dart';
import '../../providers/orders.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quentity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        // Card(
        //   margin: EdgeInsets.all(15),
        //   child: Padding(
        //     padding: EdgeInsets.all(8),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Text(
        //           'Total',
        //           style: TextStyle(fontSize: 20),
        //         ),
        //         Spacer(),
        //         Chip(
        //           label: Text(
        //             '\$${cart.totalAmount.toStringAsFixed(2)}',
        //             style: TextStyle(
        //               color: Theme.of(context).primaryTextTheme.title.color,
        //             ),
        //           ),
        //           backgroundColor: Theme.of(context).primaryColor,
        //         ),
        //         OrderButton(cart: cart)
        //       ],
        //     ),
        //   ),
        // ),

        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('\$${cart.totalAmount.toStringAsFixed(2)}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('\$' + 'TOTAL')
                ],
              ),
              Container(
                width: 170,
                child: CustomButton(
                  onpressed: () {},
                  text: 'ORDER NOW',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
    );
  }
}
