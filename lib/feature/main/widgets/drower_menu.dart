import 'package:english_app/feature/main/cubit/drower_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrowerMenu extends StatelessWidget {
  const DrowerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade800,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: const [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(Icons.account_circle, color: Colors.white, size: 70),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Adilet Ibraev',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(developer)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              children: const [
                ListTileWidget(
                  title: 'Home',
                  index: 0,
                  icon: Icons.home,
                ),
                ListTileWidget(
                    title: 'Basic Tenses',
                    index: 1,
                    icon: Icons.menu_book_sharp),
                ListTileWidget(
                    title: 'Irregular Verbs',
                    index: 2,
                    icon: Icons.library_books_rounded),
                 ListTileWidget(
                    title: 'Online Translator',
                    index: 3,
                    icon: Icons.translate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.index,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrowerCubit, DrowerState>(
      builder: (context, state) {
        return ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: state.index == index ? Colors.white : Colors.white54),
          ),
          leading: Icon(icon,
              color: state.index == index ? Colors.white : Colors.white54),
          onTap: () => context.read<DrowerCubit>().getValue(1, index: index),
        );
      },
    );
  }
}
