import 'package:blushaakk/join/nonphone.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-');
        }
      } else {
        if (nonZeroIndex % 7 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 4) {
          buffer.write('-');
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class PhoneNumberValidation extends StatefulWidget {
  const PhoneNumberValidation({super.key});

  @override
  _PhoneNumberValidationState createState() => _PhoneNumberValidationState();
}

class _PhoneNumberValidationState extends State<PhoneNumberValidation> {
  final TextEditingController phoneController = TextEditingController();
  bool isButtonEnabled = false;
  bool showNewTextField = false;
  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      updateButtonState();
    });
  }

  void updateButtonState() {
    String phone = phoneController.text;
    String filteredPhone = phone.replaceAll("-", "");
    setState(() {
      isButtonEnabled = filteredPhone.length == 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '휴대전화 번호',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumberFormatter(),
                LengthLimitingTextInputFormatter(13),
              ],
            ),
            Positioned(
                right: 0,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: isButtonEnabled
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return ColorList.primary
                                .withOpacity(0.5); // Disabled background color
                          }
                          return ColorList.primary; // Regular background color
                        },
                      ),
                    ),
                    onPressed: isButtonEnabled
                        ? () {
                            setState(() {
                              showNewTextField = true;
                            });
                            print("인증 요청");
                          }
                        : null, // null을 설정하여 버튼을 비활성화
                    child: const Text(
                      "인증 요청",
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
        if (showNewTextField)
          Column(
            children: [
              const TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '인증번호 입력',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NonPhone(),
                    ),
                  );
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '인증번호가 오지 않아요!',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
      ],
    );
  }
}
