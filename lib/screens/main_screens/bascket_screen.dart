import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BascketScreen extends StatefulWidget {
  const BascketScreen({super.key});

  @override
  State<BascketScreen> createState() => _BascketScreenState();
}

class _BascketScreenState extends State<BascketScreen> {
  @override
  Widget build(BuildContext context) {
    final cubitA = CounterCubit();
    final subscription = cubitA.stream.listen(print);
    return Container(
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(cubitA.state.toString()),
          SizedBox(
            height: 30,
            width: 30,
            child: ElevatedButton(
              onPressed: () {
                print("subscription");
                setState(() {
                  cubitA.increment();
                });
              },
              child: const Text("data"),
            ),
          ),
          const Text("teo"),
        ],
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
