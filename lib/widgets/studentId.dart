import '../widgets/qr_code.dart';
import 'package:flutter/material.dart';


class StudentID extends StatefulWidget {
  StudentID({Key? key}) : super(key: key);

  final String firstName = "Pascal";
  final String lastName = "Block";
  final int matriculationNumber = 123456;
  final DateTime startSemesterTicket = DateTime(2023, 09, 30);
  final DateTime endSemesterTicket = DateTime(2022, 10, 01);
  bool _studentIdIsVisible = false;

  @override
  State<StudentID> createState() => _StudentIDState();
}

class _StudentIDState extends State<StudentID> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          FilledButton(
            onPressed: () {
              setState(() {
                widget._studentIdIsVisible = !widget._studentIdIsVisible;
              });
            },
            child: const Text('Digitaler Studienausweis'),
          ),
          const SizedBox(height: 16),
          Visibility(
              visible: widget._studentIdIsVisible,
              child: QrCode(
                  firstName: widget.firstName,
                  lastName: widget.lastName,
                  matriculationNumber: widget.matriculationNumber,
                  startSemesterTicket: widget.startSemesterTicket,
                  endSemesterTicket: widget.endSemesterTicket
              )
          )
        ]
    );
  }
}