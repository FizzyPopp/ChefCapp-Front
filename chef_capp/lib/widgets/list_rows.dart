import 'package:chef_capp/index.dart';

class ButtonRow extends StatelessWidget {
  final String headingText;
  final String interactionText;
  final Function onTap;

  ButtonRow({
    this.headingText,
    this.interactionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: xMargins),
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              headingText,
              style: Theme.of(context).textTheme.headline,
            ),
            Row(
              children: <Widget>[
                Text(
                  interactionText,
                  style: Theme.of(context).textTheme.button,
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).textTheme.button.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
