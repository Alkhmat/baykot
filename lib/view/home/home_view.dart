import 'package:baykot/classes/string/string_class.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subscription',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.042,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Per month  48',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.026,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.070,
                  width: w * 0.112,
                  child: Image.asset(
                    'assets/icons/Vector.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Reminder',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: h * 0.020,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: h * 0.135,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.1,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xff4CA1FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: w * 0.28,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                height: h * 0.050,
                                width: w * 0.083,
                                child: Image.asset(
                                  string.listicon[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [Text(string.listtext[index])],
                            )
                          ],
                        )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
