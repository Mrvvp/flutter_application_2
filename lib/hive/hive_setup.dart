
import 'package:flutter_application_2/view/expense_screen.dart';
import 'package:flutter_application_2/view/income_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> setupHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(IncomeTransactionAdapter());
  Hive.registerAdapter(ExpenseTransactionAdapter());

  await Hive.openBox<IncomeTransaction>('incomeTransactions');
  await Hive.openBox<ExpenseTransaction>('expenseTransactions');
}

class IncomeTransactionAdapter extends TypeAdapter<IncomeTransaction> {
  @override
  final typeId = 0;

  @override
  IncomeTransaction read(BinaryReader reader) {
    return IncomeTransaction(
      type: reader.readString(),
      amount: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, IncomeTransaction obj) {
    writer.writeString(obj.type);
    writer.writeDouble(obj.amount);
  }
}

class ExpenseTransactionAdapter extends TypeAdapter<ExpenseTransaction> {
  @override
  final typeId = 1;

  @override
  ExpenseTransaction read(BinaryReader reader) {
    return ExpenseTransaction(
      type: reader.readString(),
      amount: reader.readDouble(),
      date: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseTransaction obj) {
    writer.writeString(obj.type);
    writer.writeDouble(obj.amount);
    writer.writeString(obj.date.toIso8601String());
  }
}
