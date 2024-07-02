// import 'package:flutter/material.dart';
// import 'package:projectakhir/domain/model/lost_item_model.dart';
// import 'package:projectakhir/presentation/controller/lost_item_controller.dart';

// class FormScreen extends StatefulWidget {
//   final String token;

//   const FormScreen({super.key, required this.token});

//   @override
//   State<FormScreen> createState() => _FormScreenState();
// }

// class _FormScreenState extends State<FormScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final LostItemController _controller = LostItemController();
//   final TextEditingController _itemNameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _lastSeenLocationController =
//       TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _rewardController = TextEditingController();
//   final TextEditingController _imageController = TextEditingController();
//   final TextEditingController _postDateController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.updateToken(widget.token);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Lost Item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _itemNameController,
//                 decoration: InputDecoration(labelText: 'Item Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter item name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter description';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _categoryController,
//                 decoration: InputDecoration(labelText: 'Category'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter category';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _lastSeenLocationController,
//                 decoration: InputDecoration(labelText: 'Last Seen Location'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter last seen location';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _dateController,
//                 decoration: InputDecoration(labelText: 'Date'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter date';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _rewardController,
//                 decoration: InputDecoration(labelText: 'Reward'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter reward';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _imageController,
//                 decoration: InputDecoration(labelText: 'Image URL'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter image URL';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _postDateController,
//                 decoration: InputDecoration(labelText: 'Post Date'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter post date';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     LostItem newItem = LostItem(
//                       id: null,
//                       userId: 1, // Sesuaikan dengan user ID yang sesuai
//                       itemName: _itemNameController.text,
//                       description: _descriptionController.text,
//                       category: _categoryController.text,
//                       lastSeenLocation: _lastSeenLocationController.text,
//                       date: _dateController.text,
//                       reward: _rewardController.text,
//                       image: _imageController.text,
//                       postDate: _postDateController.text,
//                     );
//                     _controller.createLostItem(newItem).then((_) {
//                       Navigator.pop(context);
//                     }).catchError((error) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Error: $error')),
//                       );
//                     });
//                   }
//                 },
//                 child: Text('Add Lost Item'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
