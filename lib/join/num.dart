import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SocialSecurityFields extends StatelessWidget {
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController lastSevenController = TextEditingController();

  SocialSecurityFields({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: width * 0.4,
          child: TextField(
            controller: birthDateController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: '생년월일6자리',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
          ),
        ),
        const Text('   —   '),
        Container(
          alignment: Alignment.center,
          width: width * 0.4,
          child: TextField(
            controller: lastSevenController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: ' * * * * * * *',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(7),
            ],
          ),
        ),
      ],
    );
  }
}
