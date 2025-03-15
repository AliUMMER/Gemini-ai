import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemeni_ai/bloc/gemini_bloc.dart';

import '../model_class/gemini_model.dart';

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

late GeminiModel data;
TextEditingController message = TextEditingController();

class _home_PageState extends State<home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black26,
          leading: Icon(
            Icons.menu_outlined,
            color: Colors.white30,
          )),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
                border: Border.all(width: 5)),
            child: BlocBuilder<GeminiBloc, GeminiState>(
              builder: (context, state) {
                if (state is GemeniblocLoading) {
                  return (CircularProgressIndicator());
                }
                if (state is GeminiblocError) {
                  return (Text('22222'));
                }
                if (state is GemeniblocLoaded) {
                  data = BlocProvider.of<GeminiBloc>(context).geminiModel;
                  return (Text('data'.toString()));
                } else
                  return Container();
              },
            ),
          ),
          Container(
            child: TextField(
              controller: message,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<GeminiBloc>(context)
                    .add(fetchgemini(message: message.text));
              },
              child: Text(
                'Generate',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ))
        ],
      ),
    );
  }
}
