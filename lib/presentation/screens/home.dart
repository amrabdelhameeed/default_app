import 'package:default_app/bussiness_logic/localization_cubit.dart/locale_cubit.dart';
import 'package:default_app/core/constants/app_routes.dart';
import 'package:default_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:default_app/core/localaization/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "hello".tr(context),
                  style: const TextStyle(fontSize: 35),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.settings);
                    },
                    child: const Text('data'))
              ],
            ),
          );
        },
      ),
    );
  }
}
