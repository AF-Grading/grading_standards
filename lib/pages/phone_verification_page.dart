import 'package:base32/base32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/otp.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/application_state.dart';
import '../models/current_user.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  // Generate a unique key
  String _myKey = Uuid().v1();
  String _totp = "";
  late String _keyKey;
  final _controller = TextEditingController();

  @override
  void initState() {
    // convert the unique key to the typcial format used by Authenticator apps
    _keyKey = base32.encodeString(_myKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: context.watch<CurrentUser>().secret == null
            ? Column(children: [
                Text("Set  up two Factor"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text("Copy this key into the Google Authenticator App:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(_keyKey),
                      GestureDetector(
                        child: const Icon(Icons.copy),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: _keyKey))
                              .then((result) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Copied to your clipboard !')));
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Text("Now, type the key from Google Authenticator Here:"),
                Center(
                  child: Pinput(
                    controller: _controller,
                    length: 6,
                    onCompleted: (myPin) {
                      setState(() {
                        _totp = OTP
                            .generateTOTPCode(
                                _keyKey, DateTime.now().millisecondsSinceEpoch,
                                isGoogle: true,
                                interval: 30,
                                // GOOGLE USES SHA1
                                algorithm: Algorithm.SHA1)
                            .toString();
                      });
                    },
                  ),
                ),
                Text(_totp),
                ElevatedButton(
                    onPressed: () {
                      //String pin = OTP.generateTOTPCodeString(
                      //  _keyKey, DateTime.now().millisecondsSinceEpoch);

                      setState(() {
                        _totp = OTP.generateTOTPCodeString(
                            _keyKey, DateTime.now().millisecondsSinceEpoch);
                      });

                      if (_controller.text == _totp) {
                        print("YOOOO");
                      }
                    },
                    child: Text("Result")),
              ])
            : Column(
                children: [
                  ElevatedButton(
                      onPressed: (() =>
                          context.read<ApplicationState>().otp2("k")),
                      child: Text("Send Text")),
                  Center(
                    child: Pinput(
                      length: 6,
                      onCompleted: (myPin) {
                        String pin = OTP.generateTOTPCodeString(
                            _myKey, DateTime.now().millisecondsSinceEpoch);

                        if (pin == myPin) {
                          print("YOOOO");
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
