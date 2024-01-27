import 'package:clothes_app_crud/model/clothes.dart';
import 'package:flutter/material.dart';

class EditClothing extends StatefulWidget {
  final Clothing clothing;
  final int index;

  final Function editClothes;

  const EditClothing(
      {super.key,
      required this.editClothes,
      required this.index,
      required this.clothing});

  @override
  State<EditClothing> createState() => _EditClothingState();
}

class _EditClothingState extends State<EditClothing> {
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

    widget.editClothes(newClothing, widget.index);

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _clothingNameController.text = widget.clothing.clothingName;
    _clothingColorController.text = widget.clothing.clothingColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  "Edit your clothing",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ))
          ],
        ));
  }
}
