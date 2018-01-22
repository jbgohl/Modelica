within Modelica.Electrical.Analog.Examples.Utilities;
model Resistor "Input/output block of a resistance model"
  extends Modelica.Blocks.Icons.Block;
  parameter Modelica.SIunits.Resistance R=1 "Resistance";
  Modelica.Electrical.Analog.Basic.VoltageToCurrentAdaptor voltageToCurrent1(
      use_pder=false, use_fder=false)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput v1(unit="V")
    "Voltage of left oneport of conduction element"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealOutput i1(unit="A")
    "Current generated by the conduction element"
    annotation (Placement(transformation(extent={{-100,-90},{-120,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor  resistor(R=R)
    annotation (Placement(transformation(extent={{-10,-2},{10,18}})));
  Modelica.Blocks.Interfaces.RealInput v2(unit="V")
    "Voltage of right oneport of conduction element"
    annotation (Placement(transformation(extent={{140,60},{100,100}})));
  Modelica.Blocks.Interfaces.RealOutput i2(unit="A")
    "Current generated by the conduction element"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Electrical.Analog.Basic.VoltageToCurrentAdaptor voltageToCurrent2(
      use_fder=false, use_pder=false)
    annotation (Placement(transformation(extent={{30,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));
equation

  connect(i1, voltageToCurrent1.f) annotation (Line(points={{-110,-80},{-60,-80},
          {-60,-8},{-23,-8}}, color={0,0,127}));
  connect(voltageToCurrent2.f, i2) annotation (Line(points={{23,-8},{60,-8},{60,
          -80},{110,-80}}, color={0,0,127}));
  connect(voltageToCurrent1.p, v1) annotation (Line(points={{-23,8},{-60,8},{-60,
          80},{-120,80}}, color={0,0,127}));
  connect(voltageToCurrent2.p, v2) annotation (Line(points={{23,8},{60,8},{60,80},
          {120,80}}, color={0,0,127}));
  connect(voltageToCurrent1.pin_p, resistor.p)
    annotation (Line(points={{-18,8},{-10,8}}, color={0,0,255}));
  connect(resistor.n, voltageToCurrent2.pin_p)
    annotation (Line(points={{10,8},{18,8}}, color={0,0,255}));
  connect(voltageToCurrent1.pin_n, ground.p)
    annotation (Line(points={{-18,-8},{0,-8}}, color={0,0,255}));
  connect(ground.p, voltageToCurrent2.pin_n)
    annotation (Line(points={{0,-8},{18,-8}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Text(
                extent={{-48,-36},{48,-68}},
                lineColor={135,135,135},
                textString="to FMU"),Text(
                extent={{-94,96},{-10,66}},
                horizontalAlignment=TextAlignment.Left,
          textString="v1"),        Text(
                extent={{-150,-114},{150,-144}},
          textString="R=%R"),      Bitmap(extent={{-88,-36},{92,56}},
            fileName="modelica://Modelica/Resources/Images/Electrical/Analog/Resistor.png"),
          Text( extent={{12,96},{96,66}},
                horizontalAlignment=TextAlignment.Right,
          textString="v2"),        Text(
                extent={{12,-62},{96,-92}},
                horizontalAlignment=TextAlignment.Right,
          textString="i2"),        Text(
                extent={{-94,-64},{-10,-94}},
                horizontalAlignment=TextAlignment.Left,
          textString="i1")}));
end Resistor;
