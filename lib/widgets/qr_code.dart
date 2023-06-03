import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode(
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

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    String formattedStartSemesterTicket = DateFormat('dd.MM.yyyy').format(widget.startSemesterTicket);
    String formattedEndSemesterTicket = DateFormat('dd.MM.yyyy').format(widget.endSemesterTicket);

    return QrImageView(
      data: 'Vorname: ${widget.firstName}, '
          'Nachname: ${widget.lastName}, '
          'Matrikelnummer: ${widget.matriculationNumber}, '
          'Semesterticket gültig ab: $formattedStartSemesterTicket,'
          ' Semesterticket gültig bis: $formattedEndSemesterTicket',
      version: QrVersions.auto,
      size: 200.0,
      dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle, color: Colors.green),
      eyeStyle:
          const QrEyeStyle(eyeShape: QrEyeShape.circle, color: Colors.green),
    );
  }
}
