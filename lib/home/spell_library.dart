import 'package:flutter/material.dart';

class SpellLibrary extends StatefulWidget {
  const SpellLibrary({super.key});

  @override
  State<StatefulWidget> createState() => _SpellLibraryState();
}

class _SpellLibraryState extends State<SpellLibrary> {
  var names = ["Fireball", "Meteor", "Divine Smite"];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('My Spells'),
      controlAffinity: ListTileControlAffinity.leading,
      expansionAnimationStyle:
          AnimationStyle(duration: const Duration(milliseconds: 150)),
      children: <Widget>[
        Column(
          children: [
            for (var name in names) _SpellCard(name),
          ],
        )
      ],
    );
  }
}

class _SpellCard extends StatelessWidget {
  final String _name;

  const _SpellCard(this._name);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(_name),
      controlAffinity: ListTileControlAffinity.leading,
      expansionAnimationStyle:
          AnimationStyle(duration: const Duration(milliseconds: 150)),
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: const Text('Spell Description'),
        ),
      ],
    );
  }
}
