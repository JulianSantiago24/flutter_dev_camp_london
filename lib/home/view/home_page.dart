import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_camp_london/home/cubit/home_cubit.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 209, 213),
        title: const Text(
          '🏕️ Dev Camp London 2️⃣0️⃣2️⃣4️⃣💂🏼‍♂️',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/london_home.jpg',
                  ),
                  Positioned(
                    top: 100,
                    left: MediaQuery.sizeOf(context).width / 8,
                    child: Column(
                      children: [
                        TextButton.icon(
                          onPressed: () => context.go('/plants'),
                          icon: const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.red,
                            size: 30,
                          ),
                          label: const Text(
                            'Go to UI Plants',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => context.go('/toDo'),
                          icon: const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.red,
                            size: 30,
                          ),
                          label: const Text(
                            'Go to TO-DO',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => context.go('/jsonS'),
                          icon: const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.red,
                            size: 30,
                          ),
                          label: const Text(
                            'Go to JSON-Serializable',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),                
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 191, 221, 227),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                        'assets/images/flutter.png',
                        fit: BoxFit.contain,                
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
