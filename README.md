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

MY NOTES

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

77 Building a Custom List Item

- understanding what to display to the user for each card element
- use card, with rows, columns and containers, to organise the display
- for tx.amount and tx.txDate... add .toString() - Text must display a string

78 Styling a Container

- add a margin inside the container
- use BoxDecoration() to set width of border and color
- to make the amount set to decimal places in all cases, change toString() to toStringAsFixed(2)

79 Styling Text

- using style / TextStyle() to update amount style
- changing color of font
- setting fontsize
- setting fontweight

80 More Styling

- updating title aand date format and style

81 Containers vs Columns vs Rows

- Container >>
  -- a single child
  -- many alignment & styling options
  -- flexible width ( consider the child width)
  -- useful for custom styling and alignment

- Row / Colum >>
  -- multiple child = children
  -- only alignment options (no styling)
  -- always takes available height (column) and width (row)
  -- used to layout widgets to sit next to / about each other

- Containers / Rows / Columns
  -- use them to create layouts, combine them and use their features

82 String Interpolation

- use the ${content}
- remember the ‘ \ ‘ escape key, especially useful for using
  -- double or single quotation marks
  -- a dollar $ sign

83 Installing External Packages & Formatting Dates

- no standard function for formatting dates
- have to use external package
  -- intl (see pub.dev) >> is developed by dart.dev
  -- update to the DateTime code
  --- `DateFormat.yMMMEd().format(tx.txDate),`
  --- toString(), is no longer needed for the date,
  ---- intl knows to output to String format by default

-- installing packages >>> update the pubspec.yaml code with the dependencies >> remember to save, this starts - pub get

84 DateFormat Patterns

- refer to intl package, api reference

85 Adding Text Input Widgets (TextField)

- add area for the input fields
- add TextButton() fields, with
  -- style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple),

86 Fetching User Input

- set up function that adds a new transaction when the ‘Add Transaction’ button is pressed

First Method / Option
-- add two properties to the class, under the transaction data
--- `String titleInput` & `String amountInput`
--- mark the type with ? = String? titleInput
--- to check function is working, use the print statements below inside TextButton
onPressed: () {
print(titleInput);
print(amountInput);
},

Second Method / Option - preferred

- inside the class initialize a TextEditingController() for each TextField - amount - title
  - setup the controller with the TextField and reference the property
    - titleController / amountController

setting `controller` inside the `TextField` with a TextEditingController, controls the text being edited

87 Splitting the App into Widgets
