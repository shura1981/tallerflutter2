import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider_provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _slider = Provider.of<SliderProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(slider: _slider),
    );
  }
}

class Container extends StatelessWidget {
  const Container({
    Key? key,
    required SliderProvider slider,
  })  : _slider = slider,
        super(key: key);

  final SliderProvider _slider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Slider.adaptive(
              min: 100,
              max: 400,
              value: _slider.value,
              onChanged: _slider.enabled
                  ? (value) {
                      _slider.value = value;
                      print(value);
                    }
                  : null),
          Checkbox(
              value: _slider.enabled,
              onChanged: (value) => _slider.enabled = value ?? true),
          CheckboxListTile(
              title: Text('activar slicer'),
              value: _slider.enabled,
              onChanged: (value) => _slider.enabled = value ?? true),
          Switch(
              value: _slider.enabled,
              onChanged: (value) => _slider.enabled = value),
          SwitchListTile(
              title: Text('activar slicer'),
              value: _slider.enabled,
              onChanged: (value) => _slider.enabled = value),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage(
                  'https://i.pinimg.com/originals/19/44/a6/1944a6b941bb3429bd7ee384855a78ea.png',
                ),
                fit: BoxFit.contain,
                width: _slider.value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
