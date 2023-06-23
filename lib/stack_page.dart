import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_position/offset_reporting_widget.dart';
import 'package:widget_position/stack_cubit.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StackCubit(),
      child: const StackContent(),
    );
  }
}

class StackContent extends StatelessWidget {
  const StackContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget position'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<StackCubit, Offset>(builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  OffsetReportingWidget(
                    onOffsetChanged: (offset) =>
                        context.read<StackCubit>().notifyOffsetWidget(offset),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(state.toString())
          ],
        );
      }),
    );
  }
}
