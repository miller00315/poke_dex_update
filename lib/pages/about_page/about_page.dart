import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_dex/config/consts/palette.dart';
import 'package:poke_dex/injector/main.dart';
import 'package:poke_dex/pages/about_page/widgets/about_tab.dart';
import 'package:poke_dex/pages/about_page/widgets/evolution_tab.dart';
import 'package:poke_dex/pages/about_page/widgets/status_tab.dart';
import 'package:poke_dex/stores/pokemon/pokemon_store.dart';

class AboutPage extends StatefulWidget {
  final PokemonStore? pokemonStore;

  const AboutPage({
    Key? key,
    this.pokemonStore,
  }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;
  PokemonStore? _pokemonStore;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    _pageController = PageController(initialPage: 0);

    _pokemonStore = widget.pokemonStore ?? serviceLocator<PokemonStore>();

    _disposer = reaction(
      (f) => _pokemonStore!.currentPokemon,
      (dynamic r) => _pageController!.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _disposer();

    _tabController!.dispose();

    _pageController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Observer(
            builder: (context) => TabBar(
              onTap: (index) => _pageController!.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              controller: _tabController,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: _pokemonStore!.pokemonColor,
              unselectedLabelColor: Palette.unselectedLabelColor,
              tabs: const [
                Tab(
                  text: "Sobre",
                ),
                Tab(
                  text: "Evolução",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) => _tabController!.animateTo(
          index,
          duration: const Duration(milliseconds: 300),
        ),
        controller: _pageController,
        children: [
          AboutTab(),
          EvolutionTab(
            pokemonStore: _pokemonStore!,
          ),
          StatusTab(),
        ],
      ),
    );
  }
}
