import 'package:flutter/material.dart';
import 'package:store_inventory_tracker/models/product.dart';
import 'package:store_inventory_tracker/widgets/text_input_widget.dart';
import 'package:store_inventory_tracker/util/validators.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key, required Product product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productCategoryController = TextEditingController();
  final productQuantityController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    productCategoryController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
        backgroundColor: Colors.amber,
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              SizedBox(height: 30),
              TextInputWidget(
                controller: productNameController,
                label: 'Product Name ',
                icon: Icons.production_quantity_limits_outlined,
                validate: Validators.nameValidator,
              ),
              SizedBox(height: 30),
              TextInputWidget(
                controller: productCategoryController,
                label: 'Product Category',
                icon: Icons.list,
                validate: (v) => v == null || v.trim().isEmpty
                    ? 'Please enter a category'
                    : null,
              ),
              SizedBox(height: 30),
              TextInputWidget(
                controller: productQuantityController,
                label: 'Product Quantity',
                textInputType: TextInputType.number,
                icon: Icons.inventory_outlined,
                validate: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Please enter quantity';
                  }
                  if (int.tryParse(v.trim()) == null) {
                    return 'Enter a valid integer';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product is valid')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fix the errors')),
                    );
                  }
                },
                child: Text("Add Product"),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
