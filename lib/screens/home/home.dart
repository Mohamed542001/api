part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(

            appBar: AppBar(
              title: const Text(
                'News App',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (i) => cubit.changeBottomNavBar(i),
              currentIndex: cubit.currentIndex,
              selectedIconTheme: const IconThemeData(color: Colors.red),
              unselectedIconTheme: const IconThemeData(color: Colors.black),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
