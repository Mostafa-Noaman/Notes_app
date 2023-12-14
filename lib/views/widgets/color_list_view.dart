import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color});

  final bool isPicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  radius: 36,
                  backgroundColor: color,
                ),
                const Positioned(
                  left: 10,
                  top: 48,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: color,
            ),
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffA4036F),
    Color(0xff048BA8),
    Color(0xff16DB93),
    Color(0xffEFEA5A),
    Color(0xffF29E4C),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              color: colors[index],
              isPicked: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
