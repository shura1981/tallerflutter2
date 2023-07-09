import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../talleres/pages/widgets/data_source.dart';

class HelperLayout extends StatelessWidget {
  final num width;
  const HelperLayout({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (width < 480) {
      return Center(
        child: Text('Mobile'),
      );
    }
    if (width < 700) {
      return Center(
        child: Text('Mobile landscape'),
      );
    } else if (width < 769) {
      return Center(
        child: Text('tablet'),
      );
    } else if (width < 1024) {
      return Center(
        child: Text('laptop'),
      );
    } else if (width < 1200) {
      return Center(
        child: Text('desktop'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('extra large'),
        actions: [
          Center(
            child: PopupMenuButton(
              child: Text('Contenido'),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('item 1'),
                ),
                PopupMenuItem(
                  child: Text('item 2'),
                ),
                PopupMenuItem(
                  child: Text('item 3'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Center(
            child: PopupMenuButton(
              child: Text('Opciones'),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('item 1'),
                ),
                PopupMenuItem(
                  child: Text('item 2'),
                ),
                PopupMenuItem(
                  child: Text('item 3'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
          ),
          CircleAvatar(
            maxRadius: 14,
            child: Text('SL'),
            backgroundColor: Colors.brown,
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          // menú contextual
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('item 1'),
              ),
              PopupMenuItem(
                child: Text('item 2'),
              ),
              PopupMenuItem(
                child: Text('item 3'),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Container(
              color: Theme.of(context).cardColor.withOpacity(.3),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('extra large'),
                  SizedBox(height: 20),
                  FilaUno(),
                  SizedBox(height: 20),
                  FilaTres(),
                  SizedBox(height: 40),
                  Container(color: Colors.red, child: FilaDos()),
                  SizedBox(height: 40),
                  PaginatedDataTableDemo(),
                  SizedBox(height: 40),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Charts()),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Charts extends StatelessWidget {
  const Charts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Card(
            child: Column(children: const [
              Text('Card  1'),
              SizedBox(height: 20),
              Text('Card  1'),
              SizedBox(height: 20),
              Text('Card  1'),
              SizedBox(height: 20),
              Text('Card  1'),
              SizedBox(height: 20),
            ]),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Chart(
            data: const [
              {'genre': 'Sports', 'sold': 275},
              {'genre': 'Strategy', 'sold': 115},
              {'genre': 'Action', 'sold': 120},
              {'genre': 'Shooter', 'sold': 350},
              {'genre': 'Other', 'sold': 150},
            ],
            variables: {
              'genre': Variable(
                accessor: (Map map) => map['genre'] as String,
              ),
              'sold': Variable(
                accessor: (Map map) => map['sold'] as num,
              ),
            },
            marks: [IntervalMark()],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        )
      ],
    );
  }
}

class FilaTres extends StatelessWidget {
  const FilaTres({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class FilaDos extends StatelessWidget {
  const FilaDos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(child: MyTable()),
      ],
    );
  }
}

class FilaUno extends StatelessWidget {
  const FilaUno({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Theme.of(context).cardTheme.color,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                  SizedBox(height: 20),
                  Text('Card 1'),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Text('Card 2'),
                  SizedBox(height: 20),
                  Text('Card 2'),
                  SizedBox(height: 20),
                  Text('Card 2'),
                  SizedBox(height: 20),
                  Text('Card 2'),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Text('Card 3'),
                  SizedBox(height: 20),
                  Text('Card 3'),
                  SizedBox(height: 20),
                  Text('Card 3'),
                  SizedBox(height: 20),
                  Text('Card 3'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Ciudad')),
          DataColumn(label: Text('Celular')),
          DataColumn(label: Text('Correo')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('John Doe')),
            DataCell(Text('Ciudad A')),
            DataCell(Text('123456789')),
            DataCell(Text('john.doe@example.com')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('Jane Smith')),
            DataCell(Text('Ciudad B')),
            DataCell(Text('987654321')),
            DataCell(Text('jane.smith@example.com')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Robert Johnson')),
            DataCell(Text('Ciudad C')),
            DataCell(Text('456789123')),
            DataCell(Text('robert.johnson@example.com')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('Lisa Davis')),
            DataCell(Text('Ciudad D')),
            DataCell(Text('789123456')),
            DataCell(Text('lisa.davis@example.com')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('Michael Wilson')),
            DataCell(Text('Ciudad E')),
            DataCell(Text('321654987')),
            DataCell(Text('michael.wilson@example.com')),
          ]),
        ],
      ),
    );
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  const PaginatedDataTableDemo({super.key});

  @override
  PaginatedDataTableDemoState createState() => PaginatedDataTableDemoState();
}

class PaginatedDataTableDemoState extends State<PaginatedDataTableDemo>
    with RestorationMixin {
  final RestorableDessertSelections _dessertSelections =
      RestorableDessertSelections();
  final RestorableInt _rowIndex = RestorableInt(0);
  final RestorableInt _rowsPerPage =
      RestorableInt(PaginatedDataTable.defaultRowsPerPage);
  final RestorableBool _sortAscending = RestorableBool(true);
  final RestorableIntN _sortColumnIndex = RestorableIntN(null);
  late DessertDataSource _dessertsDataSource;
  bool initialized = false;

  @override
  String get restorationId => 'paginated_data_table_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_dessertSelections, 'selected_row_indices');
    registerForRestoration(_rowIndex, 'current_row_index');
    registerForRestoration(_rowsPerPage, 'rows_per_page');
    registerForRestoration(_sortAscending, 'sort_ascending');
    registerForRestoration(_sortColumnIndex, 'sort_column_index');

    if (!initialized) {
      _dessertsDataSource = DessertDataSource(context);
      initialized = true;
    }
    switch (_sortColumnIndex.value) {
      case 0:
        _dessertsDataSource.sort<String>((d) => d.name, _sortAscending.value);
        break;
      case 1:
        _dessertsDataSource.sort<num>((d) => d.calories, _sortAscending.value);
        break;
      case 2:
        _dessertsDataSource.sort<num>((d) => d.fat, _sortAscending.value);
        break;
      case 3:
        _dessertsDataSource.sort<num>((d) => d.carbs, _sortAscending.value);
        break;
      case 4:
        _dessertsDataSource.sort<num>((d) => d.protein, _sortAscending.value);
        break;
      case 5:
        _dessertsDataSource.sort<num>((d) => d.sodium, _sortAscending.value);
        break;
      case 6:
        _dessertsDataSource.sort<num>((d) => d.calcium, _sortAscending.value);
        break;
      case 7:
        _dessertsDataSource.sort<num>((d) => d.iron, _sortAscending.value);
        break;
    }
    _dessertsDataSource.updateSelectedDesserts(_dessertSelections);
    _dessertsDataSource.addListener(_updateSelectedDessertRowListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      _dessertsDataSource = DessertDataSource(context);
      initialized = true;
    }
    _dessertsDataSource.addListener(_updateSelectedDessertRowListener);
  }

  void _updateSelectedDessertRowListener() {
    _dessertSelections.setDessertSelections(_dessertsDataSource.desserts);
  }

  void sort<T>(
    Comparable<T> Function(Dessert d) getField,
    int columnIndex,
    bool ascending,
  ) {
    _dessertsDataSource.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex.value = columnIndex;
      _sortAscending.value = ascending;
    });
  }

  @override
  void dispose() {
    _rowsPerPage.dispose();
    _sortColumnIndex.dispose();
    _sortAscending.dispose();
    _dessertsDataSource.removeListener(_updateSelectedDessertRowListener);
    _dessertsDataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      restorationId: 'paginated_data_table_list_view',
      padding: const EdgeInsets.all(16),
      children: [
        PaginatedDataTable(
          header: const Text('PaginatedDataTable'),
          rowsPerPage: _rowsPerPage.value,
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage.value = value!;
            });
          },
          initialFirstRowIndex: _rowIndex.value,
          onPageChanged: (rowIndex) {
            setState(() {
              _rowIndex.value = rowIndex;
            });
          },
          sortColumnIndex: _sortColumnIndex.value,
          sortAscending: _sortAscending.value,
          onSelectAll: _dessertsDataSource.selectAll,
          columns: [
            DataColumn(
              label: const Text('Desert'),
              onSort: (columnIndex, ascending) =>
                  sort<String>((d) => d.name, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Calories'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.calories, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Fat (gm)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.fat, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Carbs (gm)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.carbs, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Protein (gm)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.protein, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Sodium (mg)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.sodium, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Calcium (%)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.calcium, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Iron (%)'),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  sort<num>((d) => d.iron, columnIndex, ascending),
            ),
          ],
          source: _dessertsDataSource,
        ),
      ],
    );
  }
}
