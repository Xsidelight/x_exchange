import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_exchange/presentation/coins_screen/cubit/coins_cubit.dart';
import 'package:x_exchange/presentation/coins_screen/widgets/coin_screen_loaded_body.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsCubit, CoinsState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return Container();
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (coinList) {
            return CoinScreenLoadedBody(
              coinList: coinList,
            );
          },
          error: () => const Center(
            child: Text('Ops! Something went wrong!'),
          ),
        );
      },
    );
  }
}
