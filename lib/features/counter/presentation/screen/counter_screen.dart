import 'package:remindery/core/di/dependency_injection.dart';
import 'package:remindery/core/widget/app_button_widget.dart';
import 'package:remindery/core/widget/app_text_field_widget.dart';
import 'package:remindery/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:remindery/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:remindery/utils/colors/hex_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterState();
}

class _CounterState extends State<CounterScreen> {
  late final TextEditingController searchController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Alice alice = getIt();
      alice.showOverlay();
    });
    searchController = TextEditingController();
    searchController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppTextField(
                    hintText: 'Tuliskan nama pokemon...',
                    hintColor: Colors.black,
                    borderColor: HexColor("b2b5bf"),
                    controller: searchController,
                    maxLine: 5,
                    height: null,
                    onChange: (String query) {},
                    onFieldSubmitted: (String query) {
                      FocusScope.of(context).unfocus();
                    },
                    onTap: () {},
                    onTapOutside: () {},
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppButtonWidget(
                    text: 'Cari',
                    textColor: HexColor('2142b8'),
                    onTap: () {
                      if (searchController.text.isNotEmpty) {
                        BlocProvider.of<PokemonBloc>(context)
                            .add(SearchPokemonEvent(name: searchController.text));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 32,),
          BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoading) {
                return CircularProgressIndicator();
              }
              if (state is PokemonErrorState) {
                return Text(
                  state.appException.message.toString(),
                );
              }
              if (state is PokemonResult) {
                return SizedBox(
                  child: CachedNetworkImage(
                    imageUrl:
                    state.pokemonEntity.image,
                    placeholder: (context, url) => SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: HexColor(neutral950),
                        ),
                      ),
                    ),
                    imageBuilder:
                        (context, imageProvider) =>
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        Text("Error load image"),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: null,
            tooltip: 'Counter',
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                final counter =
                state is CounterResult ? "${state.counter}" : "0";
                return CounterText(counter: counter);
              },
            ),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(CounterDecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterText extends StatelessWidget {
  final String counter;

  const CounterText({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      counter,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
