import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multiplication table',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(218, 148, 121, 1),
          ),
        ),
        home: const HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final number = TextEditingController();

  final range = TextEditingController();

  int range_int = 0;

  int number_int = 0;

  bool theme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme ? Colors.grey.shade900 : Colors.red.shade50,
      appBar: AppBar(
        title: Text(
          "Multiplication Table",
          style: TextStyle(
            color: theme ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme
            ? Colors.redAccent
            : Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: TextField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: theme ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: theme
                            ? Colors.red
                            : Theme.of(context).colorScheme.inversePrimary,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: theme
                            ? Colors.red
                            : Theme.of(context).colorScheme.inversePrimary,
                        width: 2,
                      ),
                    ),
                    labelText: "Enter a number",
                    labelStyle: TextStyle(
                      color: theme ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: TextField(
                  controller: range,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: theme ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: theme
                              ? Colors.red
                              : Theme.of(context).colorScheme.inversePrimary,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: theme
                            ? Colors.red
                            : Theme.of(context).colorScheme.inversePrimary,
                        width: 2,
                      ),
                    ),
                    labelText: "Enter the range",
                    labelStyle: TextStyle(
                      color: theme ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        range_int = int.parse(range.text.toString());
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme
                          ? Colors.red
                          : Theme.of(context).colorScheme.inversePrimary,
                      foregroundColor: theme ? Colors.white : Colors.black,
                      elevation: 10,
                      shadowColor: theme ? Colors.red : Colors.grey,
                    ),
                    child: const Text("Done"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        range_int = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme
                          ? Colors.red
                          : Theme.of(context).colorScheme.inversePrimary,
                      foregroundColor: theme ? Colors.white : Colors.black,
                      elevation: 10,
                      shadowColor: theme ? Colors.red : Colors.grey,
                    ),
                    child: const Text("Clear"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 2,
                color: theme
                    ? Colors.red
                    : Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: range_int,
                  itemBuilder: (context, index) {
                    number_int = int.parse(number.text.toString());
                    return Center(
                      child: Text(
                        "$number_int   X   ${index + 1}   =   ${number_int * (index + 1)}",
                        style: TextStyle(
                          fontSize: 25,
                          color: theme ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme
                      ? Colors.red
                      : Theme.of(context).colorScheme.inversePrimary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: theme ? Colors.red : Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 25,
                          color: theme ? Colors.white : Colors.black,
                        ),
                      ),
                      Switch(
                        value: theme,
                        onChanged: (value) {
                          setState(
                            () {
                              theme = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
