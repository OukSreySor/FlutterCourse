import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/converter.dart';
class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final _amountDollar = TextEditingController();
  String _convertedAmount = '';
  Device? _selectedDevice = Device.euro;

  final Map<Device, double> _conversionRates = {
    Device.euro: 0.95,    
    Device.riels: 4100,  
    Device.dong: 25400,  
  };

  void _convertAmount() {
    // Get the entered amount in dollars
    final enteredAmount = double.tryParse(_amountDollar.text) ?? 0.0;

    // Get the conversion rate for the selected device
    final rate = _conversionRates[_selectedDevice] ?? 1.0;

    final converted = enteredAmount * rate;

    // Update the converted amount string
    setState(() {
      _convertedAmount = converted.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/w8-s2/currency-exchange.png', width: 100, height: 100,),
              const Text(
                'Converter', 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Amount in dollars:'),
                  const SizedBox(height: 12,), 
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: _amountDollar,
                    decoration: InputDecoration(
                      prefix: const Text('\$ '),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white), // Always visible when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white), // Visible when focused
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _convertAmount();
                    },
                  ),
                  const SizedBox(height: 36),
                  const Text('Device:'),
                  DropdownButton<Device>( 
                    value: _selectedDevice, 
                    items: Device.values.map((device) =>
                      DropdownMenuItem<Device>(
                        child: Text(device.name.toUpperCase()),
                        value: device,
                      ),
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDevice = value;
                      });
                      _convertAmount();
                    }
                  ),
                  const SizedBox(height: 36),
                  const Text('Amount in selected device:'),
                  const SizedBox(height: 12,), 
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white), 
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white), 
                      ),
                      border: InputBorder.none,
                      hintText: _convertedAmount,
                    ),
                  ),

                ]
              ),
            ],
          ),
        ),
      )
    );
  }
}









