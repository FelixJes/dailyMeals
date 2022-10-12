import 'dart:ffi';

import 'package:dailymeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  static const routeName = '/filter-Screen';

  final void Function() saveFilters;
  final void Function() currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactouse'];
    _vegan = widget.currentFilters['vegen'];
    _vegetarian = widget.currentFilters['vegetarian'];
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'), actions: [
        IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'loctose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save))
      ]),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Meal Selection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten Free', 'Only include gluten free Meals', _glutenFree,
                (value) {
              setState(() {
                _glutenFree = value;
              });
            }),
            _buildSwitchListTile(
                'Lactous Free', 'Only include latous-free Meals', _lactoseFree,
                (value) {
              setState(() {
                _lactoseFree = value;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only include Vegetarian Meals', _vegetarian,
                (value) {
              setState(() {
                _vegetarian = value;
              });
            }),
            _buildSwitchListTile('Vegan', 'Only include Vegan Meals', _vegan,
                (value) {
              setState(() {
                _vegan = value;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
