import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPagePlants extends StatefulWidget {
  const DetailsPagePlants({super.key});

  @override
  State<DetailsPagePlants> createState() => _DetailsPagePlantsState();
}

class _DetailsPagePlantsState extends State<DetailsPagePlants> {

  List<IconData> starts = [
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star_border,
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
                  height: MediaQuery.sizeOf(context).height / 7,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 131, 226, 134),                
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(170),
                      bottomRight: Radius.circular(170),
                    ),
                  ),
                ),
                const Center(
                  heightFactor: 2,
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top:30),
                  child: IconButton(
                    onPressed: () => context.go('/plants'),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              heightFactor: 2,
              child: Text(
                'Birds nest fern ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: starts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Icon(
                        starts[index],
                        color: const Color.fromARGB(241, 244, 222, 25),
                      ),
                    ],
                  );
                }
              )
            ),
            const SizedBox(
              height: 5,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 280,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 233, 233),
                        borderRadius: BorderRadius.circular(200),
                      ),                    
                      child: Hero(
                        tag: 'plantOne',
                        child: Image.asset(
                          'assets/images/plants_one.png',
                          package: 'flutter_ui_plants',
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 170,
                  right: 0,
                  width: 150,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 124, 213, 127),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                    ),                    
                    child: Center(
                      child: Text(
                        r'Price $200',
                        style: TextStyle(                          
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              heightFactor: 1,
              child: ListTile(
                title: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Laborum qui pariatur velit aliquip ex officia ea. Veniam do duis est ex et et elit sint sunt nisi. Do cillum minim commodo nulla dolore tempor ipsum. Do magna nisi pariatur nisi dolore occaecat veniam culpa incididunt sint sit officia velit.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 124, 213, 127),
        currentIndex: _selectedTab,
        onTap: _changeTab,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
        ],
      ),
    );
  }
}
