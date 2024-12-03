import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reserva_restaurant/core/utils/formateador_fecha.dart';
import 'package:reserva_restaurant/features/admin/pages/historial_page.dart';
import 'package:reserva_restaurant/features/admin/pages/lista_reservaciones.dart';
import 'package:reserva_restaurant/features/admin/pages/reportes_page.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            getCurrentDate(),
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person_4),
              tooltip: 'Perfil',
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const PerfilPage()),
                // );
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                  shadowColor: Colors.black,
                  popUpAnimationStyle: AnimationStyle(
                      reverseDuration: const Duration(seconds: 5)),
                  items: [
                    PopupMenuItem(
                      value: 'Salir',
                      child: const Text(
                        'Salir',
                      ),
                      onTap: () {
                        logout(context);
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
        body: const NavigationExample());
  }

  void logout(BuildContext context) {
    //! Cierra la aplicación en Android
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: Colors.grey,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.history_edu_rounded),
            icon: Badge(child: Icon(Icons.history)),
            label: 'Historial',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.report),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.report_gmailerrorred),
            ),
            label: 'Reporte',
          ),
        ],
      ),
      body: getPageContent(currentPageIndex),
    );
  }

  Widget getPageContent(
    int index,
  ) {
    switch (index) {
      case 0:
        return const ListaReservaciones();
      case 1:
        return const HistorialAceptados();
      case 2:
        return const VerReportes();
      // case 3:
      //   return ;
      default:
        return Container();
    }
  }
}
