/// Communication channels for measurement and control.
library channels;

export 'src/channels/measurement_channel.dart'
    show MeasurementChannel, TypedMeasurementChannel;
export 'src/channels/control_channel.dart';
export 'src/channels/setpoint_value_channel.dart';
export 'src/channels/value_formatter.dart'
    show
        ValueFormatter,
        FixedNumberFormatter,
        PercentFormatter,
        BooleanFormatter;
