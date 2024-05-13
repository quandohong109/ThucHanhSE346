import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return
                  Column(
                    children: [
                      Text('$state', style: textTheme.displayMedium),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: LinearProgressIndicator(
                          value: state / 10,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      )
                    ],
                  );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Expanded(
                    child: FloatingActionButton(
                      key: const Key('counterView_decrement_floatingActionButton'),
                      child: const Icon(Icons.remove),
                      onPressed: () => context.read<CounterCubit>().decrement(),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: FloatingActionButton(
                      key: const Key('counterView_increment_floatingActionButton'),
                      child: const Icon(Icons.add),
                      onPressed: () => context.read<CounterCubit>().increment(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}