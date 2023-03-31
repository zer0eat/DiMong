import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AbilityData {
  final String ability;
  final double value;
  final Color color;

  AbilityData(this.ability, this.value, this.color);
}

class AbilityGauge extends StatelessWidget {
  final AbilityData data;

  AbilityGauge(this.data);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 5,
          startAngle: 180,
          endAngle: 360,
          //radiusFactor: 0.6,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
            thickness: 0.3,
            cornerStyle: CornerStyle.bothCurve,
            color: Color.fromARGB(20, 0, 0, 0),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          annotations: [
            GaugeAnnotation(
              widget: Container(
                child: Text(
                  '${data.ability}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: data.color,
                  ),
                ),
              ),
              angle: 90,
              positionFactor: 0.2,
            ),
          ],
          ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 5,
                        color: data.color,
                        startWidth: 0.3,
                        endWidth: 0.3,
                      ),
                    ],
          pointers: <GaugePointer>[
            RangePointer(
              width: 0.3,
              value: data.value,
              sizeUnit: GaugeSizeUnit.factor,
              color: data.color,
              animationDuration: 1,
              cornerStyle: CornerStyle.bothCurve,
              gradient: SweepGradient(
                colors: [
                  data.color.withOpacity(0.3),
                  data.color.withOpacity(0.4),
                  data.color.withOpacity(0.5),
                  data.color.withOpacity(0.7),
                  data.color.withOpacity(0.85),
                  data.color.withOpacity(1),
                ],
                stops: [
                  0,
                  0.2,
                  0.35,
                  0.55,
                  0.8,
                  1
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}