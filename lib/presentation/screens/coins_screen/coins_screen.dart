import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_exchange/data/repository/coins_repository.dart';
import 'package:x_exchange/presentation/screens/coins_screen/coins_cubit/cubit/coins_cubit.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CoinsCubit(coinsRepository: CoinsRepository()),
        child: BlocBuilder<CoinsCubit, CoinsState>(
          bloc: context.read<CoinsCubit>()..loadCoins(),
          builder: (context, state) {
            return state.when(
                initial: () => Container(),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loaded: (coinList) => ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(coinList[index].name),
                        subtitle: Text(coinList[index].type),
                        trailing: CircleAvatar(
                          child: Text(
                            coinList[index].value.toString(),
                          ),
                        ),
                      ),
                    ),
                error: () => Container());
          },
        ),
      ),
    );
  }
}
