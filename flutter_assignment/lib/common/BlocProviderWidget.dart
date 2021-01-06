import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/bloc/store/store_bloc.dart';
import 'package:flutterassignment/bloc/store/store_event.dart';
import 'package:flutterassignment/bloc/store/store_repository.dart';
import 'package:flutterassignment/screen/store_screen.dart';

///Provides bloc to child widgets
class BlocProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<StoreBloc>(
        create: (context) => StoreBloc(storeRepository: StoreRepository())

          ///load the FetchAllDataStoreEvent when app starts
          ..add(FetchAllDataStoreEvent()),
        child: StoreScreen(),
      ),
    );
  }
}
