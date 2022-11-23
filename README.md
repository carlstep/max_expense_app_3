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

87 Splitting the App into Widgets (refactor widgets)

purpose is to organise the code into manageable chunks, by refectoring to widgets

- create transaction_list.dart to maintain a new widget just for transactions
- create models folder, move transaction.dart to the folder, this acts as a folder for custom types of data. Update import location
- create widgets folder, to hold widget specific files
- in transaction_list.dart, create a list - `final List<Transaction> _userTransaction = [];` and move the dummy transactions from main.dart to inside the list
- move the column with the list of transactions from main.dart to transaction_list.dart. update the import packages
- update main.dart with the widget, TransactionList()
- CREATES ISSUE - transaction data is inside transaction_list.dart but the trigger to add new data is inside main.data. HOW TO CONNECT THE DATA? - LIFTING STATE UP
- create two new widgets - new_transaction.dart / user_transaction.dart - using these new widgets will allow us to remove unnecessary complexity from the main.dart file.
- remove card widget (has the fields for inputting data) and place inside new_transaction.dart and add the TextEditingController() properties. t
- user_transactions.dart - create stf widget. create Column with NewTransaction() and TransactonList() - update the imports

- in transaction_list.dart, to receive the transactions from user_transactions, declare `final List<Transaction> transactions;` inside the Stl widget of transaction_list.dart, create a constructor `TransactionList(this.transactions);` to pass data from the parent widget `user_transactions.dart` to child widget `transaction_list.dart`.
- update map to transactions.map

88 Connecting Widgets and Managing State

- add new transaction functionality
- inside user_transaction.dart, create a new method with two properties txTitle, txAmount. build a constructor with title, amount, id, txDatestte.
- setState inside \_addNewTransaction
  -- `setState(() {_userTransactions.add(newTx);});`

89 Adding User Transactions to the List

- connecting ???

90 Making the List Scrollable
content (list of transactions) on main.dart is not scrollable

- in main.dart, wrap the column, with the UserTransactions(), with a SingleChildScrollView widget. this creates a box for items within to scroll. THIS ALLOWS THE ITEMS AND THE ENTRY FORM TO SCROLL.
- in transaction_list.dart, wrap the highest level column() with a container() widget, set the height to 400, then wrap the column() with a SingleChildScroView widget. this will ensure the list is scrollable, but the form will not.

91 Working with ListViews

an alternative solution to wrapping transaction.map column with a SingleChilScrollView widget is to use ListView

replace Column() of transactions.map with ListView()

becareful of `viewport`, ListView has an infinite height because the number of items are unknown. Wrapping the ListView with a container, and set height, gives the ListView a height.

have two options - ListView(children: []), and wrapped with Container() or ListView.builder(). ListView.builder will only load what is visible. Should be used for long lists and lists of unknown length.

92 Input & Output styling

- enter numbers with a number keyboard
- trigger 'add transaction' when done is clicked
- always see 2 digits

- use `keyboardType: TextInputType.number` - this brings up a number keyboard. Using - keyboardType: `TextInputType.numberWithOptions(decimal: true)` brings up the number keyboard with a decimal (.) option

- use onSubmitted with a function
  create a new function `void submitData() {}`
  inside the brackets call a method `addTx`
  call submitData in the TextField for title and amount, using - `onSubmitted: (_) => submitData()`,
  and also call submitData on the TextButton -
  `onPressed: submitData,`

if the buttons are pressed before values for title and amount have been entered, use if statement in the submitData() function

93 AppBar Buttons & FAB
add a button to the action bar and a FAB

- inside AppBar, add `actions`, then IconButton
- outside of SingleChildScrollView, add `floatingActionButton`, then FloatingActionButton. FloatingActionButtonLocation can be set

94 Showing a Modal Bottom Sheet
show a Modal Bottom Sheet when either the FAB or AppBar button is pressed. The sheet with contain the Transaction Data.

- create a method, inside the main.dart file, under the MyHomePage class - `void startAddNewTransaction()`. call the function `showModalBottomSheet`, which is a function available with flutter, this has a context and builder.

!! lots more to review on lesson 94

95 Improving & Styling Modal Bottom Sheet
