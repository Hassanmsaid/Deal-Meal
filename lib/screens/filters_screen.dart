import 'package:dealmeal/model/filters_data.dart';
import 'package:dealmeal/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const id = 'filters_screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluten, _vegetarian = false, _vegan = false, _lactoseFree = false;

  Widget buildSwitchItem(var title, var subtitle, var val, Function update) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(subtitle),
      value: val,
      onChanged: (bool value) {
        update(value);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _gluten = Provider.of<FiltersData>(context).filters['gluten'];
    _vegan = Provider.of<FiltersData>(context).filters['vegan'];
    _vegetarian = Provider.of<FiltersData>(context).filters['vegetarian'];
    _lactoseFree = Provider.of<FiltersData>(context).filters['lactose'];

    return Consumer<FiltersData>(
      builder: (BuildContext context, FiltersData value, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Filters'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Provider.of<FiltersData>(context, listen: false).filters['gluten'] = _gluten;
                },
              )
            ],
          ),
          drawer: NavDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Adjust your favourite meals',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildSwitchItem('Gluten-free', 'Only gluten-free meals', _gluten, (newValue) {
                      setState(() {
                        Provider.of<FiltersData>(context, listen: false).filters['gluten'] = newValue;
                      });
                    }),
                    buildSwitchItem('Lactose-free', 'Only lactose-free meals', _lactoseFree, (newValue) {
                      setState(() {
                        Provider.of<FiltersData>(context, listen: false).filters['lactose'] = newValue;
                      });
                    }),
                    buildSwitchItem('Vegetarian', 'Only vegetarian meals', _vegetarian, (newValue) {
                      setState(() {
                        Provider.of<FiltersData>(context, listen: false).filters['vegetarian'] = newValue;
                      });
                    }),
                    buildSwitchItem('Vegan', 'Only vegan meals', _vegan, (newValue) {
                      setState(() {
                        Provider.of<FiltersData>(context, listen: false).filters['vegan'] = newValue;
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
