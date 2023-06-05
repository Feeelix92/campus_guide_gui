import '../widgets/qr_code.dart';
import 'package:flutter/material.dart';

class StudentID extends StatefulWidget {
  StudentID(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.matriculationNumber,
      required this.startSemesterTicket,
      required this.endSemesterTicket})
      : super(key: key);

  final String firstName;
  final String lastName;
  final int matriculationNumber;
  final DateTime startSemesterTicket;
  final DateTime endSemesterTicket;
  bool _studentIdIsVisible = false;

  @override
  State<StudentID> createState() => _StudentIDState();
}

class _StudentIDState extends State<StudentID> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              endSemesterTicket: widget.endSemesterTicket))
    ]);
  }
}
