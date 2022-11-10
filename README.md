# max_expense_app_3

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

70 - overview of project
71 - overview of core flutter widgets
72 - planning the app
73 - combining widgets

- Setup of new project, planning the layout, create placeholder widgets,
- working with card widgets, understanding how parent/child dependecies work.
- How container widgets work with child and parent widgets.
- Card widget depends on the size of the child, unless the parent widget has its own defined width, then the card takes the width of the parent.
- Column will take the width as its widest child.

74 - understanding column alignment

- crossAxisAlignment vs mainAxisAlignment (row vs column)

75 - Adding a Transaction Model & Transaction Data

- setup transaction properties in their own class.
- create transaction.dart file
- build a contructor with named argumments, use required keyword
- mark the variables as final.
- update main.dart to import transaction.dart file
- in main.dart, add - final List<Transaction> txList = []; to the MyHomePage class.
- setup dummy transaction data inside the transactions list

76 Mapping Data into Widgets

- setup a card, with a text widget, to return the title (tx.title)
- the card widget, sits inside a column widget, the children are pointing
  to the txList.map
- for every tx in the txList.map, an instance of card is drawn in the app
