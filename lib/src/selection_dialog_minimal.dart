import 'package:flutter/material.dart';

import 'country_code.dart';
import 'country_localizations_minimal.dart';

/// selection dialog used for selection of the country code
class SelectionDialogMinimal extends StatefulWidget {
  final List<CountryCode> elements;
  final bool? showCountryOnly;
  final InputDecoration? searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;
  final double flagWidth;
  final Decoration? flagDecoration;
  final Size? size;
  final bool hideSearch;
  final Icon? closeIcon;

  /// Boxshaow color of SelectionDialog that matches CountryCodePicker barrier color
  final Color? barrierColor;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  final TextDirection? searchItemsDirection;
  final BorderRadiusGeometry? borderRadius;

  const SelectionDialogMinimal(
    this.elements,
    this.favoriteElements, {
    super.key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    this.searchDecoration,
    this.searchStyle,
    this.textStyle,
    this.backgroundColor,
    this.showFlag,
    this.flagDecoration,
    this.flagWidth = 32,
    this.size,
    this.barrierColor,
    this.hideSearch = false,
    this.closeIcon,
    this.searchItemsDirection,
    this.borderRadius,
  });

  @override
  State<StatefulWidget> createState() => _SelectionDialogMinimalState();
}

class _SelectionDialogMinimalState extends State<SelectionDialogMinimal> {
  /// this is useful for filtering purpose
  late List<CountryCode> filteredElements;

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        width: widget.size?.width ?? MediaQuery.of(context).size.width,
        height: widget.size?.height ?? MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              textDirection: widget.searchItemsDirection,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  iconSize: 20,
                  icon: widget.closeIcon!,
                  onPressed: () => Navigator.pop(context),
                ),
                if (!widget.hideSearch)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        style: widget.searchStyle,
                        decoration: widget.searchDecoration,
                        onChanged: _filterElements,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: ListView(
                shrinkWrap: false,
                children: [
                  widget.favoriteElements.isEmpty
                      ? const DecoratedBox(decoration: BoxDecoration())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...widget.favoriteElements.map(
                              (f) => SimpleDialogOption(
                                child: _buildOption(f),
                                onPressed: () {
                                  _selectItem(f);
                                },
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                  if (filteredElements.isEmpty)
                    _buildEmptySearchWidget(context)
                  else
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredElements.length,
                      separatorBuilder: (_, index) => const Divider(),
                      shrinkWrap: true,
                      itemBuilder: (_, int index) => SimpleDialogOption(
                        child: _buildOption(filteredElements[index]),
                        onPressed: () => _selectItem(filteredElements[index]),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildOption(CountryCode e) {
    return SizedBox(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          if (widget.showFlag!)
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 16.0),
                decoration: widget.flagDecoration,
                clipBehavior: widget.flagDecoration == null ? Clip.none : Clip.hardEdge,
                child: Image.asset(
                  e.flagUri!,
                  package: 'country_code_picker_minimal',
                  width: widget.flagWidth,
                ),
              ),
            ),
          Expanded(
            flex: 4,
            child: Text(
              widget.showCountryOnly! ? e.toCountryStringOnly() : e.toLongStringInverse(),
              overflow: TextOverflow.fade,
              style: widget.textStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(
      child: Text(CountryLocalizationsMinimal.of(context)?.translate('no_country') ?? 'No country found'),
    );
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) => e.code!.contains(s) || e.dialCode!.contains(s) || e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}
