import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/widgets/background.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return Scaffold(
      body:backgroundColor(size.width, size.height,

          ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ))
    );
  }
}


class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'Ginecologia E OBSTETRÍCIA',
    <Entry>[
      Entry(
        'Notas',
        <Entry>[
          Entry('Atividade 1'),
          Entry('Atividade 2'),
          Entry('Atividade 3'),
          Entry('Trabalho 1'),
          Entry('Trabalho 2'),
          Entry('Prova 1'),
          Entry('Prova 2'),



        ],
      ),

    ],
  ),
  Entry(
    'ORTOPEDIA',
    <Entry>[
      Entry(
        'Notas',
        <Entry>[
          Entry('Atividade 1'),
          Entry('Atividade 2'),
          Entry('Atividade 3'),
          Entry('Trabalho 1'),
          Entry('Trabalho 2'),
          Entry('Prova 1'),
          Entry('Prova 2'),



        ],
      ),

    ],
  ),
  Entry(
    'PRONTO SOCORRO',
    <Entry>[
      Entry(
        'Notas',
        <Entry>[
          Entry('Atividade 1'),
          Entry('Atividade 2'),
          Entry('Atividade 3'),
          Entry('Trabalho 1'),
          Entry('Trabalho 2'),
          Entry('Prova 1'),
          Entry('Prova 2'),



        ],
      ),

    ],
  ),
  Entry(
    'ENFERMAGEM EM NEONATOLOGIA',
    <Entry>[
      Entry(
        'Notas',
        <Entry>[
          Entry('Atividade 1'),
          Entry('Atividade 2'),
          Entry('Atividade 3'),
          Entry('Trabalho 1'),
          Entry('Trabalho 2'),
          Entry('Prova 1'),
          Entry('Prova 2'),



        ],
      ),

    ],
  ),
  Entry(
    'ENFERMAGEM EM PEDIATRIA',
    <Entry>[
      Entry(
        'Notas',
        <Entry>[
          Entry('Atividade 1'),
          Entry('Atividade 2'),
          Entry('Atividade 3'),
          Entry('Trabalho 1'),
          Entry('Trabalho 2'),
          Entry('Prova 1'),
          Entry('Prova 2'),



        ],
      ),

    ],
  ),
];
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(
        title: Text(root.title,style: TextStyles.titleListTile2,));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,style: TextStyles.titleListTile2),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

}


