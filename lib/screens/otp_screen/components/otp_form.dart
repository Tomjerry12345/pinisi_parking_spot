import 'package:flutter/material.dart';
import 'package:pinisi_parking_spot/config/email_config.dart';
import 'package:pinisi_parking_spot/config/size_config.dart';
import 'package:pinisi_parking_spot/screens/components/default_button.dart';
import 'package:pinisi_parking_spot/services/user_services/services.dart';
import 'package:pinisi_parking_spot/shared/shared.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
    required this.email,
    required this.password,
    required this.nama,
    required this.nomorUnik,
    required this.status,
    required this.platNomor,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
  final String email, password, nama, nomorUnik, status, platNomor;
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  FocusNode pin5FocusNode = FocusNode();
  FocusNode pin6FocusNode = FocusNode();

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
  TextEditingController input4 = TextEditingController();
  TextEditingController input5 = TextEditingController();
  TextEditingController input6 = TextEditingController();

  bool verify = false;
  String otp = '';

  // late EmailAuth emailAuth;
  Email_OTP emailOtp = Email_OTP();
  @override
  void initState() {
    super.initState();

    // emailAuth = EmailAuth(sessionName: "Pinisi Parking Spot");

    // emailAuth.config({
    //   "server": "https://email-auth-nodes.herokuapp.com",
    //   "serverKey": "D6faVz",
    // });

    emailOtp.setConfig(
      appEmail: "alwijein@gmail.com",
      appName: "Pinisi Parking Spot",
      userEmail: widget.email,
    );

    pin2FocusNode = FocusNode();

    sendOtp();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void sendOtp() async {
    // bool result =
    //     await emailAuth.sendOtp(recipientMail: widget.email, otpLength: 5);

    bool result = await emailOtp.sendOTP();

    if (result) {
      print('Succes');
    } else {
      print('failed ${widget.email}');
    }
  }

  // void verifyOtp() {
  //   otp = input1.text +
  //       input2.text +
  //       input3.text +
  //       input4.text +
  //       input5.text +
  //       input6.text;

  //   var result =
  //       emailAuth.validateOtp(recipientMail: widget.email, userOtp: otp);
  //   if (result) {
  //     print('succes: ' + otp);
  //     verify = true;
  //   } else {
  //     print('failed: ' + otp);
  //     verify = false;
  //   }
  // }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBackgroundColor2,
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  autofocus: true,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                  controller: input1,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin3FocusNode);
                  },
                  controller: input2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin4FocusNode);
                  },
                  controller: input3,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin5FocusNode);
                  },
                  controller: input4,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin6FocusNode);
                  },
                  controller: input5,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getPropertionateScreenWidht(40),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  style: primaryTextStyle.copyWith(
                    fontSize: getPropertionateScreenHeight(24),
                    fontWeight: medium,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                  controller: input6,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getPropertionateScreenHeight(24),
          ),
          Row(
            children: [
              Text(
                'Belum Masuk? ',
                style: primaryTextStyle,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Kirim Ulang  ',
                  style: primaryTextStyle.copyWith(
                    color: kPrimaryLightColor,
                  ),
                ),
              ),
            ],
          ),
          isLoading
              ? DefaultButton(
                  text: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropertionateScreenWidht(30),
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(
                        kPrimaryColor,
                      ),
                    ),
                  ),
                  press: () {})
              : DefaultButton(
                  text: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getPropertionateScreenWidht(18),
                    ),
                  ),
                  press: () async {
                    setState(() {
                      isLoading = true;
                      // verifyOtp();
                    });
                    otp = input1.text +
                        input2.text +
                        input3.text +
                        input4.text +
                        input5.text +
                        input6.text;
                    if (await emailOtp.verifyOTP(otp: otp) == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Verifikasi Gagal'),
                        ),
                      );
                    } else if (await emailOtp.verifyOTP(otp: otp) == true) {
                      if (await AuthServices.signUp(
                        widget.email,
                        widget.password,
                        widget.nama,
                        widget.nomorUnik,
                        widget.status,
                        widget.platNomor,
                      )) {
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Login Gagal'),
                          ),
                        );
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }),
        ],
      ),
    );
  }
}
