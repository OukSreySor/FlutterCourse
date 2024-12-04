import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
import 'package:intl/intl.dart';
//import './expenses_item.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;
  
  String get title => _titleController.text;
  
  Category? _selectedValue = Category.leisure;
  
  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  Future<void> _selectDate() async {
    //DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat.yMd().format(_selectedDate!);

      });
    }
  }

  void onAdd() {
    
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);
  
    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: _selectedDate!,
        category: _selectedValue ?? Category.leisure); 

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(_selectedDate == null ? 'No Date Selected': 'Selected Date'),
                    suffixIcon: IconButton(
                      onPressed: _selectDate, 
                      icon: Icon(Icons.calendar_month),
                    ),
                    border: InputBorder.none,
                                  
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButton<Category>(
                value: _selectedValue, 
                items: Category.values.map((category) =>
                  DropdownMenuItem<Category>(
                    child: Text(category.name.toUpperCase()),
                    value: category,
                  ),
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                }
              ),
              const Spacer(),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: onAdd, 
                child: const Text('Save Expense'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
