import 'package:chef_capp/index.dart';

class UnitChip extends StatelessWidget {
  final Function onSelected;
  final bool selected;
  final String firstLabel;
  final String secondLabel;

  final Color _myTextColor = CCColors.secondaryDark;
  final Color _myActiveTextColor = Colors.white;

  UnitChip({
    @required this.selected,
    @required this.firstLabel,
    this.secondLabel,
    @required this.onSelected,
  });

  Widget fullLabel() {
    if (secondLabel == null) {
      return Text(
        firstLabel,
        style: TextStyle(
          color: selected ? _myActiveTextColor : _myTextColor,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Text(
              firstLabel,
              style: TextStyle(
                color: selected ? _myActiveTextColor : _myTextColor,
              ),
            ),
            SizedBox(height: 3.0,),
            Text(
              secondLabel,
              style: TextStyle(
                color: selected ? _myActiveTextColor : _myTextColor,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: fullLabel(),
      selectedColor: CCColors.secondaryDark,
      backgroundColor: Colors.transparent,
      selected: selected,
      onSelected: onSelected,
      shape: StadiumBorder(
        side: BorderSide(
          color: CCColors.secondaryDark,
          width: 2.0,
        ),
      ),
    );
  }
}

class PreferenceChip extends StatelessWidget {
  final Function onSelected;
  final bool selected;
  final String label;

  final Color _myTextColor = CCColors.secondaryDark;
  final Color _myActiveTextColor = Colors.white;

  PreferenceChip({
    @required this.label,
    @required this.selected,
    @required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        this.label,
        style: TextStyle(
          color: selected ? _myActiveTextColor : _myTextColor,
        ),
      ),
      selectedColor: CCColors.secondaryDark,
      backgroundColor: Colors.transparent,
      selected: selected,
      onSelected: onSelected,
      checkmarkColor: _myActiveTextColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: CCColors.secondaryDark,
          width: 2.0,
        ),
      ),
    );
  }
}
