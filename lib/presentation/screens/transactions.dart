import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:get_dev_flutter_task/blocs/crypto/crypto_bloc.dart';
import 'package:get_dev_flutter_task/config/app_spacing.dart';
import 'package:get_dev_flutter_task/extensions/build_context.dart';

class TransactionsScreen extends StatelessWidget {
  static const String routeName = 'transactions';
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.status == FormzStatus.submissionInProgress
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        AppSpacing.verticalSpaceSmall,
                        const Text("Fetching your (BTC) transactions"),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(
                            state.btcBlock!.tx![index].hash!,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          AppSpacing.verticalSpaceMedium,
                          const Row(
                            children: [],
                          )
                        ],
                      ),
                    ),
                    itemCount: state.btcBlock?.tx?.length ?? 0,
                  ),
          ),
        ),
      ),
    );
  }
}
