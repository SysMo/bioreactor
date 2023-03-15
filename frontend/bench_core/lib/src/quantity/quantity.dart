class Unit {
  final String name;
  final int timeExp;
  final double timeMult;

  final int lengthExp;
  final double lengthMult;

  final int massExp;
  final double massMult;

  final int temperatureExp;
  final double temperatureMult;

  final int currentExp;
  final double currentMult;

  final int moleExp;
  final double moleMult;

  final int luminousExp;
  final double luminousMult;

  const Unit(this.name,
      {this.timeExp = 0,
      this.timeMult = 1,
      this.lengthExp = 0,
      this.lengthMult = 1,
      this.massExp = 0,
      this.massMult = 1,
      this.temperatureExp = 0,
      this.temperatureMult = 1,
      this.currentExp = 0,
      this.currentMult = 1,
      this.moleExp = 0,
      this.moleMult = 1,
      this.luminousExp = 0,
      this.luminousMult = 1});
}

class Units {
  static const Unit dimensionless = Unit("dimensionless");
  static const Unit fraction = Unit("dimensionless");
  static const Unit second = Unit("second", timeExp: 1);
  static const Unit minute = Unit("second", timeExp: 1, timeMult: 60.0);
  static const Unit K = Unit("K", temperatureExp: 1);
  static const Unit degC = Unit("degC", temperatureExp: 1);
  static const Unit rpm = Unit("rpm",
      timeExp: -1, timeMult: 1.0 / 60); // ?? Is it divided or multiplied?
}

abstract class Quantity {
  String get name;
  Unit get siUnit;
  Unit unit;
  double value;
  Quantity({required this.unit, required this.value});
}

class Time extends Quantity {
  @override
  String get name => "Time";
  @override
  Unit get siUnit => Units.second;

  Time({required super.unit, required super.value});
}

class Temperature extends Quantity {
  @override
  String get name => "Temperature";
  @override
  Unit get siUnit => Units.K;
  Temperature({required super.unit, required super.value});
}

class DutyCycle extends Quantity {
  @override
  String get name => "Duty cycle";
  @override
  Unit get siUnit => Units.fraction;
  DutyCycle({required super.unit, required super.value});
}
