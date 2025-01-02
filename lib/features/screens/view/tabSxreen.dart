// // // import 'package:flutter/material.dart';
// // //
// // // class AdvancedChordsInputApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: Scaffold(
// // //         appBar: AppBar(title: Text("Advanced Chords Input")),
// // //         body: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: ChordsInputPage(),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class ChordsInputPage extends StatefulWidget {
// // //   @override
// // //   _ChordsInputPageState createState() => _ChordsInputPageState();
// // // }
// // //
// // // class _ChordsInputPageState extends State<ChordsInputPage> {
// // //   final TextEditingController _controller = TextEditingController();
// // //   final _formKey = GlobalKey<FormState>();
// // //
// // //   // List of all valid chords for autocomplete suggestions
// // //   final List<String> _chordsList = [
// // //     'A',
// // //     'Am',
// // //     'A#',
// // //     'A#m',
// // //     'B',
// // //     'Bm',
// // //     'C',
// // //     'Cm',
// // //     'C#',
// // //     'C#m',
// // //     'D',
// // //     'Dm',
// // //     'D#',
// // //     'D#m',
// // //     'E',
// // //     'Em',
// // //     'F',
// // //     'Fm',
// // //     'F#',
// // //     'F#m',
// // //     'G',
// // //     'Gm',
// // //     'G#',
// // //     'G#m',
// // //     'A7',
// // //     'Am7',
// // //     'C7',
// // //     'D7',
// // //     'E7',
// // //     'G7'
// // //   ];
// // //
// // //   // Current filtered list for autocomplete
// // //   List<String> _filteredChords = [];
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Form(
// // //       key: _formKey,
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // TextFormField with real-time validation
// // //           TextFormField(
// // //             controller: _controller,
// // //             decoration: InputDecoration(
// // //               labelText: "Enter Chords",
// // //               hintText: "e.g., C Am G7 F",
// // //               border: OutlineInputBorder(),
// // //             ),
// // //             onChanged: _filterChords,
// // //             validator: (value) {
// // //               if (value == null || value.isEmpty) {
// // //                 return "Please enter chords.";
// // //               }
// // //               if (!_validateChords(value)) {
// // //                 return "Invalid chord format.";
// // //               }
// // //               return null;
// // //             },
// // //           ),
// // //           SizedBox(height: 10),
// // //
// // //           // Autocomplete suggestions
// // //           if (_filteredChords.isNotEmpty)
// // //             Container(
// // //               height: 150,
// // //               child: ListView.builder(
// // //                 itemCount: _filteredChords.length,
// // //                 itemBuilder: (context, index) {
// // //                   return ListTile(
// // //                     title: Text(_filteredChords[index]),
// // //                     onTap: () {
// // //                       setState(() {
// // //                         _controller.text = _filteredChords[index];
// // //                         _filteredChords.clear(); // Clear suggestions
// // //                       });
// // //                     },
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //
// // //           SizedBox(height: 20),
// // //
// // //           // Custom Chord Keyboard
// // //           Wrap(
// // //             spacing: 8.0,
// // //             runSpacing: 8.0,
// // //             children: [
// // //               for (var chord in [
// // //                 'A',
// // //                 'Am',
// // //                 'C',
// // //                 'D',
// // //                 'G',
// // //                 'F',
// // //                 'E',
// // //                 '#',
// // //                 'b',
// // //                 'm',
// // //                 '7'
// // //               ])
// // //                 ElevatedButton(
// // //                   onPressed: () {
// // //                     setState(() {
// // //                       _controller.text += chord + " ";
// // //                     });
// // //                   },
// // //                   child: Text(chord),
// // //                 ),
// // //             ],
// // //           ),
// // //
// // //           SizedBox(height: 20),
// // //
// // //           // Submit button
// // //           ElevatedButton(
// // //             onPressed: () {
// // //               if (_formKey.currentState!.validate()) {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(content: Text("Valid Chords: ${_controller.text}")),
// // //                 );
// // //               }
// // //             },
// // //             child: Text("Submit"),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Function to filter autocomplete suggestions based on input
// // //   void _filterChords(String input) {
// // //     setState(() {
// // //       _filteredChords = _chordsList
// // //           .where((chord) => chord.toLowerCase().startsWith(input.toLowerCase()))
// // //           .toList();
// // //     });
// // //   }
// // //
// // //   // Function to validate chords
// // //   bool _validateChords(String input) {
// // //     final chords = input.trim().split(' ');
// // //     final regex = RegExp(r'^[A-G](#|b)?(m|7)?$');
// // //     for (var chord in chords) {
// // //       if (!regex.hasMatch(chord)) return false;
// // //     }
// // //     return true;
// // //   }
// // // }
// // //
// // // void main() => runApp(AdvancedChordsInputApp());
// //
// // import 'package:flutter/material.dart';
// //
// // class AdvancedChordsApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(title: Text("Advanced Chords Input")),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: ChordsInputPage(),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class ChordsInputPage extends StatefulWidget {
// //   @override
// //   _ChordsInputPageState createState() => _ChordsInputPageState();
// // }
// //
// // class _ChordsInputPageState extends State<ChordsInputPage> {
// //   final TextEditingController _controller = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();
// //
// //   // List to store chords for the preview
// //   List<String> _chordsPreview = [];
// //   final _chordsRegex =
// //       RegExp(r'^[A-G](#|b)?(m|7|sus|dim|aug)?[2-9]?(\/[A-G](#|b)?)?$');
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // Chord Input TextFormField
// //         Form(
// //           key: _formKey,
// //           child: TextFormField(
// //             controller: _controller,
// //             decoration: InputDecoration(
// //               labelText: "Enter Chord",
// //               hintText: "e.g., C, Am, G7",
// //               border: OutlineInputBorder(),
// //             ),
// //             validator: (value) {
// //               if (value == null || value.isEmpty)
// //                 return "Please enter a chord.";
// //               if (!_chordsRegex.hasMatch(value.trim()))
// //                 return "Invalid chord format.";
// //               return null;
// //             },
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //
// //         // Buttons to Add Chord or Clear Input
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_formKey.currentState!.validate()) {
// //                   setState(() {
// //                     _chordsPreview.add(_controller.text.trim());
// //                     _controller.clear();
// //                   });
// //                 }
// //               },
// //               child: Text("Add Chord"),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _controller.clear();
// //                 });
// //               },
// //               child: Text("Clear Input"),
// //             ),
// //           ],
// //         ),
// //         SizedBox(height: 20),
// //
// //         // Chords Preview Section with Drag-and-Drop Support
// //         Text(
// //           "Chords Preview:",
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 10),
// //         _chordsPreview.isEmpty
// //             ? Text("No chords added yet.")
// //             : ReorderableListView(
// //                 shrinkWrap: true,
// //                 onReorder: _onReorderChords,
// //                 children: _chordsPreview
// //                     .map((chord) => ListTile(
// //                           key: ValueKey(chord),
// //                           title: Text(
// //                             chord,
// //                             style: TextStyle(
// //                                 fontSize: 18, color: Colors.blueAccent),
// //                           ),
// //                           trailing: IconButton(
// //                             icon: Icon(Icons.delete),
// //                             onPressed: () => _removeChord(chord),
// //                           ),
// //                         ))
// //                     .toList(),
// //               ),
// //         SizedBox(height: 20),
// //
// //         // Custom Chord Keyboard
// //         Text(
// //           "Quick Chords:",
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //         Wrap(
// //           spacing: 8.0,
// //           runSpacing: 8.0,
// //           children: [
// //             for (var chord in [
// //               'A',
// //               'Am',
// //               'C',
// //               'D',
// //               'G',
// //               'F',
// //               'E',
// //               '#',
// //               'b',
// //               'm',
// //               '7'
// //             ])
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _controller.text += chord + " ";
// //                   });
// //                 },
// //                 child: Text(chord),
// //               ),
// //           ],
// //         ),
// //         SizedBox(height: 20),
// //
// //         // Submit Button
// //         Center(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               if (_chordsPreview.isNotEmpty) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                       content: Text(
// //                           "Chords Submitted: ${_chordsPreview.join(', ')}")),
// //                 );
// //               }
// //             },
// //             child: Text("Submit Chords"),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   // Function to handle reordering chords
// //   void _onReorderChords(int oldIndex, int newIndex) {
// //     setState(() {
// //       if (newIndex > oldIndex) newIndex--;
// //       final item = _chordsPreview.removeAt(oldIndex);
// //       _chordsPreview.insert(newIndex, item);
// //     });
// //   }
// //
// //   // Function to remove a chord from the preview
// //   void _removeChord(String chord) {
// //     setState(() {
// //       _chordsPreview.remove(chord);
// //     });
// //   }
// // }
// //
// // // void main() => runApp(AdvancedChordsApp());
//
// import 'package:flutter/material.dart';
//
// class ChordsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("ChordsNote - Advanced UI")),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ChordsInputPage(),
//         ),
//       ),
//     );
//   }
// }
//
// class ChordsInputPage extends StatefulWidget {
//   @override
//   _ChordsInputPageState createState() => _ChordsInputPageState();
// }
//
// class _ChordsInputPageState extends State<ChordsInputPage> {
//   final TextEditingController _controller = TextEditingController();
//
//   // List to store added chords as chips
//   List<String> _chords = [];
//   List<String> _favorites = ['C', 'G', 'Am', 'F', 'Dm', 'Em', 'A7'];
//
//   final _validChordsRegex =
//       RegExp(r'^[A-G](#|b)?(m|7|sus|dim|aug)?[2-9]?(\/[A-G](#|b)?)?$');
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Chord Input Section
//         Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   hintText: "Type chord (e.g., C, G7, Am)",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             ElevatedButton(
//               onPressed: _addChord,
//               child: Text("Add"),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//
//         // Display Chord Chips
//         Wrap(
//           spacing: 8.0,
//           children: _chords
//               .map((chord) => Chip(
//                     label: Text(chord),
//                     deleteIcon: Icon(Icons.close),
//                     onDeleted: () => _removeChord(chord),
//                   ))
//               .toList(),
//         ),
//         SizedBox(height: 20),
//
//         // Favorites Section
//         Text(
//           "Favorites:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Wrap(
//           spacing: 8.0,
//           children: _favorites
//               .map((chord) => ElevatedButton(
//                     onPressed: () => _addFavoriteChord(chord),
//                     child: Text(chord),
//                   ))
//               .toList(),
//         ),
//         SizedBox(height: 20),
//
//         // Suggestion Panel
//         Text(
//           "Suggestions:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Wrap(
//           spacing: 8.0,
//           children: ['C', 'Am', 'G', 'F', 'D', 'E']
//               .map((chord) => OutlinedButton(
//                     onPressed: () => _addFavoriteChord(chord),
//                     child: Text(chord),
//                   ))
//               .toList(),
//         ),
//         SizedBox(height: 20),
//
//         // Submit Button
//         Center(
//           child: ElevatedButton(
//             onPressed: _submitChords,
//             child: Text("Submit Chords"),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Add chord to the list
//   void _addChord() {
//     final chord = _controller.text.trim();
//     if (chord.isNotEmpty && _validChordsRegex.hasMatch(chord)) {
//       setState(() {
//         _chords.add(chord);
//         _controller.clear();
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Invalid chord format.")),
//       );
//     }
//   }
//
//   // Add favorite chord directly to the list
//   void _addFavoriteChord(String chord) {
//     setState(() {
//       _chords.add(chord);
//     });
//   }
//
//   // Remove chord from the list
//   void _removeChord(String chord) {
//     setState(() {
//       _chords.remove(chord);
//     });
//   }
//
//   // Submit chords and show a message
//   void _submitChords() {
//     if (_chords.isNotEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Submitted Chords: ${_chords.join(', ')}")),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("No chords to submit.")),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';

class ChordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("ChordsNote - Advanced UI")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChordsManagerPage(),
        ),
      ),
    );
  }
}

class ChordsManagerPage extends StatefulWidget {
  @override
  _ChordsManagerPageState createState() => _ChordsManagerPageState();
}

class _ChordsManagerPageState extends State<ChordsManagerPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _chords = [];
  List<String> _favorites = ['C', 'G', 'Am', 'F', 'Dm', 'Em', 'A7'];
  final _validChordsRegex =
      RegExp(r'^[A-G](#|b)?(m|7|sus|dim|aug)?[2-9]?(\/[A-G](#|b)?)?$');
  final Map<String, Color> _chordColors = {
    "major": Colors.blueAccent,
    "minor": Colors.greenAccent,
    "other": Colors.orangeAccent,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Chord Input Section
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type chord (e.g., C, G7, Am)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: _addChord,
              child: Text("Add"),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Display Chord Chips
        if (_chords.isNotEmpty) ...[
          Text(
            "Your Chords:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _chords.map((chord) => _buildChordChip(chord)).toList(),
          ),
        ],
        SizedBox(height: 20),

        // Favorites Section
        Text(
          "Favorites:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 8.0,
          children: _favorites
              .map((chord) => ElevatedButton(
                    onPressed: () => _addFavoriteChord(chord),
                    child: Text(chord),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),

        // Suggestion Panel
        Text(
          "Suggestions:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 8.0,
          children: ['C', 'Am', 'G', 'F', 'D', 'E']
              .map((chord) => OutlinedButton(
                    onPressed: () => _addFavoriteChord(chord),
                    child: Text(chord),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),

        // Submit Button
        Center(
          child: ElevatedButton(
            onPressed: _submitChords,
            child: Text("Submit Chords"),
          ),
        ),
      ],
    );
  }

  // Add chord to the list
  void _addChord() {
    final chord = _controller.text.trim();
    if (chord.isNotEmpty && _validChordsRegex.hasMatch(chord)) {
      setState(() {
        _chords.add(chord);
        _controller.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid chord format.")),
      );
    }
  }

  // Add favorite chord directly to the list
  void _addFavoriteChord(String chord) {
    setState(() {
      _chords.add(chord);
    });
  }

  // Remove chord from the list
  void _removeChord(String chord) {
    setState(() {
      _chords.remove(chord);
    });
  }

  // Submit chords and show a message
  void _submitChords() {
    if (_chords.isNotEmpty) {
      // Show a dialog with the submitted chords
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Your Chords",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Play these chords in sequence:",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: _chords.map((chord) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: _getChordColor(chord),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          chord,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "No chords to submit.",
            style: TextStyle(fontSize: 16),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

// Helper function to get chord color
  Color _getChordColor(String chord) {
    if (chord.contains('m')) return Colors.greenAccent;
    if (chord.contains('7') || chord.contains('#') || chord.contains('b')) {
      return Colors.orangeAccent;
    }
    return Colors.blueAccent;
  }

  // Build styled chord chips
  Widget _buildChordChip(String chord) {
    final String type = _getChordType(chord);
    return Chip(
      label: Text(
        chord,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      backgroundColor: _chordColors[type],
      deleteIcon: Icon(Icons.close, color: Colors.white),
      onDeleted: () {
        setState(() {
          _chords.remove(chord);
        });
      },
    );
  }

  // Function to determine chord type
  String _getChordType(String chord) {
    if (chord.contains('m')) return "minor";
    if (chord.contains('7') || chord.contains('#') || chord.contains('b'))
      return "other";
    return "major";
  }
}
