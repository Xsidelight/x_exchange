import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_exchange/presentation/screens/coins_screen/coins_cubit/cubit/coins_cubit.dart';

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
            return ListView.builder(
              itemCount: coinList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(coinList[index].symbol!),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        double.parse(coinList[index].priceChangePercent!) < 0
                            ? const Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              ),
                        Text(
                          coinList[index].priceChangePercent!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
