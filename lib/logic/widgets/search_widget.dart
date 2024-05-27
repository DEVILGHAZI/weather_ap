// // import 'package:flutter/material.dart';

// // class SearchPage extends StatefulWidget {
// //   const SearchPage({super.key});

// //   @override
// //   State<SearchPage> createState() => _SearchPageState();
// // }

// // class _SearchPageState extends State<SearchPage> {
// //   final TextEditingController _searchController = TextEditingController();
// //   final FocusNode _focusNode = FocusNode();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _focusNode
// //         .requestFocus(); // Request focus on the text field when the page is loaded
// //   }

// //   @override
// //   void dispose() {
// //     _searchController.dispose();
// //     _focusNode.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromARGB(255, 16, 19, 37),
// //         foregroundColor: Colors.white,
// //         title: Container(
// //           padding: EdgeInsets.symmetric(horizontal: 10),
// //           height: 40,
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Color.fromARGB(255, 113, 111, 111)),
// //             //color: Colors.transparent,
// //             color: Color.fromARGB(255, 29, 32, 53),
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: Center(
// //             child: TextField(
// //               cursorColor: Colors.white,
// //               cursorWidth: 1.5,
// //               cursorHeight: 22,
// //               autocorrect: true,
// //               controller: _searchController,
// //               focusNode: _focusNode,
// //               decoration: const InputDecoration(
// //                 focusColor: Colors.white,
// //                 hintText: 'Search Location...',
// //                 hintStyle: TextStyle(color: Color.fromARGB(255, 132, 131, 131)),
// //                 border: InputBorder.none,
// //               ),
// //               style: const TextStyle(color: Colors.white, fontSize: 14.0),
// //               onChanged: (value) {
// //                 // Handle search text changes
// //               },
// //             ),
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.mic, color: Colors.white),
// //             onPressed: () {
// //               // Handle voice search
// //             },
// //           ),
// //         ],
// //       ),
// //       backgroundColor: const Color.fromARGB(255, 16, 19, 37),
// //       body: SingleChildScrollView(
// //         child: Container(
// //           height: 30,
// //           width: MediaQuery.sizeOf(context).width,
// //           color: Colors.white,
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<dynamic> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _focusNode
        .requestFocus(); // Request focus on the text field when the page is loaded
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _fetchSuggestions(String query) async {
    // Replace with your actual Google Places API key
    const apiKey = 'YOUR_API_KEY';
    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/autocomplete/json',
      {
        'input': query,
        'key': apiKey,
        'types': '(cities)',
      },
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _suggestions = data['predictions'];
      });
    } else {
      throw Exception('Failed to fetch suggestions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 19, 37),
        foregroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 65, 63, 63),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: TextField(
              cursorColor: Colors.white,
              cursorWidth: 1.5,
              cursorHeight: 18,
              autocorrect: true,
              controller: _searchController,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                focusColor: Colors.white,
                hintText: 'Search Location...',
                hintStyle: TextStyle(color: Color.fromARGB(255, 132, 131, 131)),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white, fontSize: 13.0),
              onChanged: (value) {
                _fetchSuggestions(value);
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {
              // Handle voice search
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 16, 19, 37),
      body: _suggestions.isNotEmpty
          ? ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _suggestions[index];
                return ListTile(
                  title: Text(suggestion['description']),
                  onTap: () {
                    // Handle location selection
                  },
                );
              },
            )
          : const Center(
              child: Text(
                'No suggestions found',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:algolia/algolia.dart';
// import 'package:algolia/algolia_places.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   List<AlgoliaPlacePickerResult> _suggestions = [];

//   late AlgoliaPlacesAutocomplete _placesAutocomplete;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode
//         .requestFocus(); // Request focus on the text field when the page is loaded
//     _placesAutocomplete = AlgoliaPlacesAutocomplete(
//       appId: 'NITOCIFOFL',
//       apiKey: '9b37a770c1cbc42d85d268ecb8b6933e',
//       language: 'en',
//       // Optionally, you can configure additional parameters like countries, aroundLatLng, etc.
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchSuggestions(String query) async {
//     try {
//       final suggestions = await _placesAutocomplete.getSuggestions(query);
//       setState(() {
//         _suggestions = suggestions;
//       });
//     } catch (e) {
//       print('Failed to fetch suggestions: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 16, 19, 37),
//         foregroundColor: Colors.white,
//         title: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           height: 40,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 65, 63, 63),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: TextField(
//               cursorColor: Colors.white,
//               cursorWidth: 1.5,
//               cursorHeight: 18,
//               autocorrect: true,
//               controller: _searchController,
//               focusNode: _focusNode,
//               decoration: const InputDecoration(
//                 focusColor: Colors.white,
//                 hintText: 'Search Location...',
//                 hintStyle: TextStyle(color: Color.fromARGB(255, 132, 131, 131)),
//                 border: InputBorder.none,
//               ),
//               style: const TextStyle(color: Colors.white, fontSize: 13.0),
//               onChanged: (value) {
//                 _fetchSuggestions(value);
//               },
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.mic, color: Colors.white),
//             onPressed: () {
//               // Handle voice search
//             },
//           ),
//         ],
//       ),
//       backgroundColor: const Color.fromARGB(255, 16, 19, 37),
//       body: _suggestions.isNotEmpty
//           ? ListView.builder(
//               itemCount: _suggestions.length,
//               itemBuilder: (context, index) {
//                 final suggestion = _suggestions[index];
//                 return ListTile(
//                   title: Text(suggestion.result.formattedString),
//                   onTap: () {
//                     // Handle location selection
//                   },
//                 );
//               },
//             )
//           : const Center(
//               child: Text(
//                 'No suggestions found',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//     );
//   }
// }

