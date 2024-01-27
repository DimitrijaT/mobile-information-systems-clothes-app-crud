import 'package:clothes_app_crud/model/clothes.dart';
import 'package:flutter/material.dart';

class NewClothing extends StatefulWidget {
  final Function addNewClothes;

  const NewClothing({super.key, required, required this.addNewClothes});

  @override
  State<NewClothing> createState() => _NewClothingState();
}

class _NewClothingState extends State<NewClothing> {
  final _clothingColorController = TextEditingController();
  final _clothingNameController = TextEditingController();

  String title = "";

  String description = "";

  void _submitData() {
    final inputClothingName = _clothingNameController.text;
    final inputClothingColor = _clothingColorController.text;

    if (inputClothingName.isEmpty || inputClothingColor.isEmpty) return;

    final newClothing =
        Clothing(0, inputClothingName, inputClothingColor, false);

    widget.addNewClothes(newClothing);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _clothingNameController,
              onSubmitted: (_) => _submitData,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            TextField(
              controller: _clothingColorController,
              onSubmitted: (_) => _submitData,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text(
                "Submit your clothing",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            )
          ],
        ));
  }
}
