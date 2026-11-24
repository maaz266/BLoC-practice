import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'counter_cubit.dart';
import 'counter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(), //CounterCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter App')),
      body: BlocListener<CounterBloc, int>(
        listener: (context, state) {
          debugPrint('Listener state: $state');
          if (state == 5) {
            debugPrint('Showing snackbar');

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Count has reached 5.')),
            );
          }
        },

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                //CounterCubit
                builder: (context, state) {
                  return Text('$state', style: const TextStyle(fontSize: 36));
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementPressed());
                  // context.read<CounterCubit>().increment();
                },
                child: const Text('Increase'),
              ),

              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementPressed());
                  // context.read<CounterCubit>().decrement(); //CounterCubit
                },
                child: const Text('Decrease'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(ResetPressed());
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
