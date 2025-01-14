import 'package:flutter/material.dart';

import '../shared/month_picker.dart';
import '../shared/picker_type.dart';
import '../shared/year_picker.dart';
import 'range_days_picker.dart';

/// Displays a grid of days for a given month and allows the user to select a
/// range of dates.
///
/// Days are arranged in a rectangular grid with one column for each day of the
/// week. Controls are provided to change the year and month that the grid is
/// showing.
///
/// The range picker widget is rarely used directly. Instead, consider using
/// [showRangeDatePickerDialog], which will create a dialog that uses this.
///
/// See also:
///
///  * [showRangeDatePickerDialog], which creates a Dialog that contains a
///    [RangeDatePicker].
///
class RangeDatePicker extends StatefulWidget {
  /// Creates a calendar range picker.
  ///
  /// It will display a grid of days for the [initialDate]'s month. if that
  /// is null, `DateTime.now()` will be used. The day
  /// indicated by [selectedRange] will be selected if provided.
  ///
  /// The optional [onRangeSelected] callback will be called if provided
  /// when a range is selected.
  ///
  /// The user interface provides a way to change the year and the month being
  /// displayed. By default it will show the day grid, but this can be changed
  /// with [initialPickerType].
  ///
  /// The [minDate] is the earliest allowable date. The [maxDate] is the latest
  /// allowable date. [initialDate] and [selectedRange] must either fall between
  /// these dates, or be equal to one of them.
  ///
  /// The [currentDate] represents the current day (i.e. today). This
  /// date will be highlighted in the day grid. If null, the date of
  /// `DateTime.now()` will be used.
  ///
  /// For each of these [DateTime] parameters, only
  /// their dates are considered. Their time fields are ignored.
  RangeDatePicker({
    super.key,
    required this.maxDate,
    required this.minDate,
    this.onRangeSelected,
    this.currentDate,
    this.initialDate,
    this.selectedRange,
    this.padding = const EdgeInsets.all(16),
    this.initialPickerType = PickerType.days,
    this.daysOfTheWeekTextStyle,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration = const BoxDecoration(),
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration = const BoxDecoration(),
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellsTextStyle,
    this.selectedCellsDecoration,
    this.singelSelectedCellTextStyle,
    this.singelSelectedCellDecoration,
    this.leadingDateTextStyle,
    this.slidersColor,
    this.slidersSize,
    this.highlightColor,
    this.splashColor,
    this.splashRadius,
    this.centerLeadingDate = false,
  }) {
    assert(!minDate.isAfter(maxDate), "minDate can't be after maxDate");
  }

  /// The initially selected date range when the picker is first opened.
  /// If the specified range contains the [initialDate], that range will be selected.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTimeRange? selectedRange;

  /// The date to which the picker will consider as current date. e.g (today).
  /// If not specified, the picker will default to today's date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? currentDate;

  /// The date to which the picker will be initially opened.
  /// If not specified, the picker will default to today's date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? initialDate;

  /// Called when the user picks a range.
  final ValueChanged<DateTimeRange>? onRangeSelected;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [maxDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime minDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [minDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime maxDate;

  /// The initial display of the calendar picker.
  final PickerType initialPickerType;

  /// The amount of padding to be added around the [DatePicker].
  final EdgeInsets padding;

  /// The text style of the week days name in the header.
  ///
  /// defaults to [TextTheme.titleSmall] with a [FontWeight.bold],
  /// a `14` font size, and a [ColorScheme.onSurface] with 30% opacity.
  final TextStyle? daysOfTheWeekTextStyle;

  /// The text style of cells which are selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color.
  final TextStyle? enabledCellsTextStyle;

  /// The cell decoration of cells which are selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration enabledCellsDecoration;

  /// The text style of cells which are not selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color with 30% opacity.
  final TextStyle? disabledCellsTextStyle;

  /// The cell decoration of cells which are not selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration disabledCellsDecoration;

  /// The text style of the current date.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.primary] color.
  ///
  /// ### Note:
  /// If [currentDate] is within the selected range this will
  /// be override by [selectedCellsTextStyle]
  final TextStyle? currentDateTextStyle;

  /// The cell decoration of the current date.
  ///
  /// defaults to circle stroke border with [ColorScheme.primary] color.
  ///
  /// ### Note:
  /// If [currentDate] is within the selected range this will
  /// be override by [selectedCellsDecoration]
  final BoxDecoration? currentDateDecoration;

  /// The text style of selected cells within the range.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onPrimaryContainer] color.
  final TextStyle? selectedCellsTextStyle;

  /// The cell decoration of selected cells within the range.
  ///
  /// defaults to circle with [ColorScheme.primaryContainer] color.
  final BoxDecoration? selectedCellsDecoration;

  /// The text style for a cell representing:
  ///
  /// 1. A single cell when initially selected.
  /// 2. The leading/trailing cell of a selected range.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onPrimary] color
  final TextStyle? singelSelectedCellTextStyle;

  /// The decoration for a cell representing:
  ///
  /// 1. A single cell when initially selected.
  /// 2. The leading/trailing cell of a selected range.
  ///
  /// If not provided, `singelSelectedCellDecoration` is a circle with the color specified
  /// in `selectedCellsDecoration`, using [ColorScheme.primary].
  final BoxDecoration? singelSelectedCellDecoration;

  /// The text style of leading date showing in the header.
  ///
  /// defaults to `18px` with a [FontWeight.bold]
  /// and [ColorScheme.primary] color.
  final TextStyle? leadingDateTextStyle;

  /// The color of the page sliders.
  ///
  /// defaults to [ColorScheme.primary] color.
  final Color? slidersColor;

  /// The size of the page sliders.
  ///
  /// defaults to `20px`.
  final double? slidersSize;

  /// The splash color of the ink response.
  ///
  /// defaults to the color of [selectedCellsDecoration],
  /// if null will fall back to [ColorScheme.onPrimary] with 30% opacity.
  final Color? splashColor;

  /// The highlight color of the ink response when pressed.
  ///
  /// defaults to [Theme.highlightColor].
  final Color? highlightColor;

  /// The radius of the ink splash.
  final double? splashRadius;

  /// Centring the leading date. e.g:
  ///
  /// <       December 2023      >
  ///
  final bool centerLeadingDate;

  @override
  State<RangeDatePicker> createState() => _RangeDatePickerState();
}

class _RangeDatePickerState extends State<RangeDatePicker> {
  PickerType? _pickerType;
  DateTime? _diplayedDate;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    _pickerType = widget.initialPickerType;
    _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());

    if (widget.selectedRange != null) {
      _selectedStartDate = DateUtils.dateOnly(widget.selectedRange!.start);
      _selectedEndDate = DateUtils.dateOnly(widget.selectedRange!.end);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RangeDatePicker oldWidget) {
    if (oldWidget.initialPickerType != widget.initialPickerType) {
      _pickerType = widget.initialPickerType;
    }

    if (widget.selectedRange != oldWidget.selectedRange) {
      if (widget.selectedRange == null) {
        _selectedStartDate = null;
        _selectedEndDate = null;
      } else {
        _selectedStartDate = DateUtils.dateOnly(widget.selectedRange!.start);
        _selectedEndDate = DateUtils.dateOnly(widget.selectedRange!.end);
      }
    }

    if (widget.initialDate != oldWidget.initialDate) {
      _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    switch (_pickerType!) {
      case PickerType.days:
        return Padding(
          padding: widget.padding,
          child: RangeDaysPicker(
            centerLeadingDate: widget.centerLeadingDate,
            currentDate: DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            initialDate: _diplayedDate,
            selectedEndDate: _selectedEndDate,
            selectedStartDate: _selectedStartDate,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            daysOfTheWeekTextStyle: widget.daysOfTheWeekTextStyle,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            selectedCellsDecoration: widget.selectedCellsDecoration,
            selectedCellsTextStyle: widget.selectedCellsTextStyle,
            singelSelectedCellTextStyle: widget.singelSelectedCellTextStyle,
            singelSelectedCellDecoration: widget.singelSelectedCellDecoration,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onLeadingDateTap: () {
              setState(() {
                _pickerType = PickerType.months;
              });
            },
            onEndDateChanged: (date) {
              setState(() {
                _selectedEndDate = date;
              });

              // this should never be null
              if (_selectedStartDate != null) {
                widget.onRangeSelected?.call(
                  DateTimeRange(
                    start: _selectedStartDate!,
                    end: _selectedEndDate!,
                  ),
                );
              }
            },
            onStartDateChanged: (date) {
              setState(() {
                _selectedStartDate = date;
                _selectedEndDate = null;
              });
            },
          ),
        );
      case PickerType.months:
        return Padding(
          padding: widget.padding,
          child: MonthPicker(
            centerLeadingDate: widget.centerLeadingDate,
            initialDate: _diplayedDate,
            selectedDate: null,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            currentDate: DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            selectedCellDecoration: widget.singelSelectedCellDecoration,
            selectedCellTextStyle: widget.singelSelectedCellTextStyle,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onLeadingDateTap: () {
              setState(() {
                _pickerType = PickerType.years;
              });
            },
            onDateSelected: (selectedMonth) {
              setState(() {
                _diplayedDate = selectedMonth;
                _pickerType = PickerType.days;
              });
            },
          ),
        );
      case PickerType.years:
        return Padding(
          padding: widget.padding,
          child: YearsPicker(
            centerLeadingDate: widget.centerLeadingDate,
            selectedDate: null,
            initialDate: _diplayedDate,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            currentDate: DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            selectedCellDecoration: widget.singelSelectedCellDecoration,
            selectedCellTextStyle: widget.singelSelectedCellTextStyle,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onDateSelected: (selectedYear) {
              setState(() {
                _diplayedDate = selectedYear;
                _pickerType = PickerType.months;
              });
            },
          ),
        );
    }
  }
}
