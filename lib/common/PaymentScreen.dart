// ignore_for_file: file_names

import 'package:auth/student_screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  FocusNode myFocusNode = FocusNode();
  Razorpay razorpay;
  TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = new TextEditingController();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void handlerPaymentSuccess() {
    print("payment success");
    Toast.show("payment success", context);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void handlerErrorFailure() {
    print("payment failed");
    Toast.show("payment failed", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void openCheckout() {
    var data = Provider.of<_PaymentScreenState>(context, listen: false);
    if (_amountController.text == "") {
      String message = "please enter amount";
      _showErrorDialog(message);
    } else {
      var options = {
        "key": "rzp_test_xz4tqVIIc6MRSi",
        "amount": num.parse(_amountController.text) * 100,
        "name": "Palanivel Earthmovers",
        "description": "Payment for our work",
        "prefill": {
          // "contact": data.mobile,
          // "email": data.mail,
        },
        "external": {
          "wallets": ["paytm"],
        },
      };
      try {
        razorpay.open(options);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(13.0),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 26,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Payment",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.black,
                    fontSize: 26,
                  ))
            ]),
          ),
          SizedBox(height: 116),
          Container(
            height: 630,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset("assets/images/payment.jpg")),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 170),
                    child: Text(
                      "Enter Amount",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 100),
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter Amount",
                          hintStyle: GoogleFonts.nunitoSans(
                              color: Colors.black, fontSize: 16)),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  IgnorePointer(
                    ignoring: false,
                    // ignore: deprecated_member_use
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 200),
                      child: ElevatedButton(
                          onPressed: () {
                            openCheckout();
                          },
                          child: Text(
                            "Pay",
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20, color: Colors.red),
                        child: (Text(
                          'Your Payments are secured. In Case you paid an extra amount, It will be refunded by PEM.',
                          textAlign: TextAlign.end,
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
