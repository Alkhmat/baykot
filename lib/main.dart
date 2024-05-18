import 'package:baykot/data/cubits/photo_picker/image_cubit.dart';
import 'package:baykot/data/cubits/tap/tap_cubit.dart';

import 'package:baykot/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Baykot());
}

class Baykot extends StatelessWidget {
  const Baykot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => ClickCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
