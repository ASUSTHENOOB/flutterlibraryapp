import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytile extends StatelessWidget {
  final String Title;
  final IconData Leading;
  final IconData Trailing;
  final void Function()? ontap;
  const Mytile(
      {super.key,
      required this.Leading,
      required this.ontap,
      required this.Title,
      required this.Trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ListTile(
        title: Text(
          Title,
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleLarge),
        ),
        onTap: ontap,
        leading: Icon(Leading, color: Theme.of(context).primaryColorLight),
        trailing: Icon(Trailing, color: Theme.of(context).primaryColorLight),
      ),
    );
  }
}
