import 'package:flutter/material.dart';

import '../model/clothes.dart';
import '../widgets/edit_clothing.dart';
import '../widgets/new_clothing.dart';

class MyClothesPage extends StatefulWidget {
  const MyClothesPage({super.key});

  @override
  State<MyClothesPage> createState() => _MyClothesPageState();
}

class _MyClothesPageState extends State<MyClothesPage> {
  final List<Clothing> _clothesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _clothesList.add(Clothing(0, "T-Shirt", "gray", false));
    _clothesList.add(Clothing(0, "Hoodie", "pastel blue", false));
    _clothesList.add(Clothing(0, "Hat", "dark red", false));
  }

  // void _incrementCounter() {
  //   setState(() {});
  // }

  void _addNewClothesShowModal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewClothing(
              addNewClothes: _addNewClothesToList,
            ),
          );
        });
  }

  void _editClothesShowModal(int index) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: EditClothing(
              editClothes: _editClothesToList,
              index: index,
              clothing: _clothesList[index],
            ),
          );
        });
  }

  void _addNewClothesToList(Clothing clothing) {
    setState(() {
      _clothesList.add(clothing);
    });
  }

  void _editClothesToList(Clothing clothing, int index) {
    setState(() {
      _clothesList[index] = clothing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Clothes CRUD App",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
        actions: [
          IconButton(
              onPressed: _addNewClothesShowModal,
              icon: const Icon(
                Icons.add_circle_outlined,
                color: Colors.green,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: _clothesList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _clothesList[index].clothingName,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
                subtitle: Text(
                  _clothesList[index].clothingColor,
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.edit, color: Colors.greenAccent),
                        onPressed: () {
                          _editClothesShowModal(index);
                        }),
                    IconButton(
                        icon: const Icon(Icons.delete_forever_rounded,
                            color: Colors.green),
                        onPressed: () {
                          setState(() {
                            _clothesList.removeAt(index);
                          });
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
