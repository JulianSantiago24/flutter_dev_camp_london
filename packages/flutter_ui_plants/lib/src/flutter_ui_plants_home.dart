import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePagePlants extends StatefulWidget {
  const HomePagePlants({super.key});

  @override
  State<HomePagePlants> createState() => _HomePagePlantsState();
}

class _HomePagePlantsState extends State<HomePagePlants> {

  List<List<String>> listsPlants = [
    ['assets/images/plants_two.png', 'Plant type 1',],
    ['assets/images/plants_three.png', 'Plant type 2',],
    ['assets/images/plants_four.png', 'Plant type 3',],
  ];

  int _selectedTab = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2.1,
                  decoration: const BoxDecoration(
                    color: Color(0xFF83E286),                
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(170),
                      bottomRight: Radius.circular(170),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 60),
                  child: IconButton(
                    onPressed: () => context.go('/'),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const Center(
                  heightFactor: 3,
                  child: Text(
                    'Our plants',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                const Center(
                  heightFactor: 11,
                  child: Text(
                    'Birds nest fern ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),             
                Positioned(
                  top: 130,                
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.arrow_circle_left,
                          color: Colors.white,
                          size: 30,
                        ),
                        GestureDetector(
                          onTap: () => context.go('/details'),
                          child: Hero(
                            tag: 'plantOne',
                            child: Image.asset(
                              'assets/images/plants_one.png',
                              package: 'flutter_ui_plants',
                            ),
                          ),
                        ),                      
                        const Icon(
                          Icons.arrow_circle_right, 
                          color: Colors.white,
                          size: 30,
                        ),                      
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Explore More ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
              child: SearchBar(
                hintText: 'Search plant...',
                trailing: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          print('Use image search');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          print('Use camera to search');
                        },
                      ),
                    ],
                shadowColor: MaterialStateProperty.all(Colors.greenAccent),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: listsPlants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 124, 213, 127),
                          ],
                        ),
                      ),
                      child:  Column(
                        children: [                      
                          Image.asset(
                            height: 140,
                            listsPlants[index][0],
                            package: 'flutter_ui_plants',                          
                          ),
                          Text(
                            listsPlants[index][1],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeTab,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
