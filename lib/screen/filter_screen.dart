import 'package:flutter/material.dart';
import 'package:flutter_online_shop/item/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = 'filter_screen';

  final Function saveFilter;
  final Map<String, bool?> currentFilters;

  FilterScreen(this.saveFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree!,
                'lactose': _lactoseFree!,
                'vegan': _vegan!,
                'vegetarian': _vegetarian!,
              };

              widget.saveFilter(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'adjust your meal selection',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-free'),
                  value: _glutenFree!,
                  subtitle: Text(
                    'include glutenFree',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('lactose-free'),
                  value: _lactoseFree!,
                  subtitle: Text(
                    'include lactoseFree',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('vegetarian'),
                  value: _vegetarian!,
                  subtitle: Text(
                    'include vegetarian',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('vegan'),
                  value: _vegan!,
                  subtitle: Text(
                    'include vegan',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
