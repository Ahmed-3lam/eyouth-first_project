import 'package:first_project/counter/cubit/cubit.dart';
import 'package:first_project/counter/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cubit.increaseCounter,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        //(3) Wrap with blocBuilder to rebuild only the text
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              cubit.counter.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
    );
  }
}
