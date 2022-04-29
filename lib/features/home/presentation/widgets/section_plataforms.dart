import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';

class SectionPlataforms extends StatelessWidget {
  final List<PlataformModel> listPlataforms;
  final TickerProvider vsync;
  final Function(int value) onSelect;
  const SectionPlataforms(
      {Key? key, required this.listPlataforms, required this.vsync, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TabBar(
        controller: TabController(
          length: listPlataforms.length,
          vsync: vsync,
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        automaticIndicatorColorAdjustment: true,
        isScrollable: true,
        dragStartBehavior: DragStartBehavior.start,
        unselectedLabelColor: Colors.black26,
        indicatorColor: Colors.amber,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
        tabs: listPlataforms
            .map(
              (plataform) => Tab(text: plataform.name),
            )
            .toList()
            .cast<Widget>(),
        onTap: (index)=> onSelect(listPlataforms.elementAt(index).id!),
      ),
    );
  }
}
