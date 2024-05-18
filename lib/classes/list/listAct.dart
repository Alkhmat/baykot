import 'package:baykot/classes/string/string_class.dart';
import 'package:flutter/material.dart';

class ListActive extends StatelessWidget {
  const ListActive({
    super.key,
    required this.h,
    required this.w,
    required this.string,
  });

  final double h;
  final double w;
  final StringClass string;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: h * 0.5851,
        width: w * 0.8,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 71,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xff3B3B3B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h * 0.055,
                          width: w * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                string.l[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.013,
                          ),
                          Text(
                            string.ltext[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            string.lxtext[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                                size: h * 0.040,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.020,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
