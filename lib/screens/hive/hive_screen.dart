import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
// link tham khảo :https://github.com/JohannesMilke/hive_database_example
import '../../boxes.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../../models/transaction.dart';
import 'components/body.dart';
import 'components/transaction_dialog.dart';

class HiveScreen extends StatefulWidget {
  static String routeName = "/hive";

  @override
  _HiveScreenState createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hive Box",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();

          return buildContent(transactions);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => TransactionDialog(
                onClickedDone: addTransaction,
              ),
            ),
            child: Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.hive),
    );
  }
}

Widget buildContent(List<Transaction> transactions) {
  if (transactions.isEmpty) {
    return Center(
      child: Text(
        'Không có giao dịch nào!',
        style: TextStyle(fontSize: 24),
      ),
    );
  } else {
    final netExpense = transactions.fold<double>(
      0,
      (previousValue, transaction) => transaction.isExpense
          ? previousValue - transaction.amount
          : previousValue + transaction.amount,
    );
    final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
    final color = netExpense > 0 ? Colors.green : Colors.red;

    return Column(
      children: [
        SizedBox(height: 24),
        Text(
          'Số dư: $newExpenseString',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = transactions[index];

              return buildTransaction(context, transaction);
            },
          ),
        ),
      ],
    );
  }
}

Widget buildTransaction(
  BuildContext context,
  Transaction transaction,
) {
  final color = transaction.isExpense ? Colors.red : Colors.green;
  final date = DateFormat.yMMMd().format(transaction.createdDate);
  final amount = '\$' + transaction.amount.toStringAsFixed(2);

  return Dismissible(
    key: Key(transaction.name.toString()),
    direction: DismissDirection.endToStart,
    onDismissed: (direction) {
      transaction.delete();
    },
    background: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFFFE6E6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Spacer(),
          SvgPicture.asset("assets/icons/Trash.svg"),
        ],
      ),
    ),
    child: ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      title: Text(
        transaction.name,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: [
        buildButtons(context, transaction),
      ],
    ),
  );
}

Widget buildButtons(BuildContext context, Transaction transaction) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            label: Text('Sửa'),
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransactionDialog(
                  transaction: transaction,
                  onClickedDone: (name, amount, isExpense) =>
                      editTransaction(transaction, name, amount, isExpense),
                ),
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: TextButton.icon(
        //     label: Text('Xóa'),
        //     icon: Icon(Icons.delete),
        //     onPressed: () => deleteTransaction(transaction),
        //   ),
        // )
      ],
    );

Future addTransaction(String name, double amount, bool isExpense) async {
  final transaction = Transaction()
    ..name = name
    ..createdDate = DateTime.now()
    ..amount = amount
    ..isExpense = isExpense;

  final box = Boxes.getTransactions();
  box.add(transaction);
  //box.put('mykey', transaction);

  // final mybox = Boxes.getTransactions();
  // final myTransaction = mybox.get('key');
  // mybox.values;/
}

void editTransaction(
  Transaction transaction,
  String name,
  double amount,
  bool isExpense,
) {
  transaction.name = name;
  transaction.amount = amount;
  transaction.isExpense = isExpense;

  // final box = Boxes.getTransactions();
  // box.put(transaction.key, transaction);

  transaction.save();
}

void deleteTransaction(Transaction transaction) {
  // final box = Boxes.getTransactions();
  // box.delete(transaction.key);

  transaction.delete();
  //setState(() => transactions.remove(transaction));
}
