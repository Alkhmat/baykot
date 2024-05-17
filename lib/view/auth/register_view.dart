import 'package:baykot/widgets/auth/register/auth_fieled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: h * 0.116,
                    backgroundColor: const Color(0xffD9D9D9),
                    child: Center(
                      child: SizedBox(
                        height: 64,
                        width: 64,
                        child: Image.asset(
                          'assets/icons/add_photo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      color: const Color(0xffC4C4C4),
                      fontSize: h * 0.042,
                      fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: const Color(0xffC4C4C4),
                  height: h * 0.01,
                  endIndent: w * 0.4,
                  indent: w * 0.4,
                )
              ],
            ),
            AuthTextFieled(
              h: h,
              labelText: 'Cost',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            AuthTextFieled(
              h: h,
              labelText: 'Site URL',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            AuthTextFieled(
              h: h,
              labelText: 'Note',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            AuthTextFieled(
              h: h,
              labelText: 'Subcrition date',
            ),
            SizedBox(
              height: h * 0.02,
            ),
            AuthTextFieled(
              h: h,
              labelText: 'Expiration date',
            ),
            SizedBox(
              height: h * 0.053,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.white10,
                child: Ink(
                  height: h * 0.065,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff4CA1FE),
                        Color(0xff32338D),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Send me notifications',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: h * 0.020),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
