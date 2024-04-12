import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//     );
//   }
// }



class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PDF Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> pdfFiles = [
    'Sample PDF 1',
    'Sample PDF 2',
    'Sample PDF 3',
    'Sample PDF 4',
    'Sample PDF 5',
    'Sample PDF 6',
    'Sample PDF 7',
    'Sample PDF 8',
    'Sample PDF 9',
    'Sample PDF 10',
  ]; // Sample PDF file names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search PDFs',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pdfFiles.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(pdfFiles[index]),
                    onTap: () {
                      // Implement download and view functionality here
                      // Example: Launch a PDF viewer for the selected PDF
                      // or initiate a download process
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
