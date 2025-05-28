import 'package:flutter/material.dart';

class DateTimeView extends StatefulWidget {
  const DateTimeView({super.key});

  @override
  State<DateTimeView> createState() => _DateTimeViewState();
}

class _DateTimeViewState extends State<DateTimeView> {
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date and Time View'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Time: ${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}',
                  // style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time!,
                    );
                    if (newTime != null && newTime != time) {
                      setState(() {
                        time = newTime;
                      });
                    }
                  },
                  child: const Text("Change Time"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Date: ${date!.day.toString().padLeft(2, '0')}/${date!.month.toString().padLeft(2, '0')}/${date!.year}',
                  // style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? newDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                      initialDate: date!,
                    );
                    if (newDate != null && newDate != date) {
                      setState(() {
                        date = newDate;
                      });
                    }
                  },
                  child: const Text("Change Date"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
