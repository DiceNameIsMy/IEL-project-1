% simulation: https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxGySQBZsQEBTAWjDACgA3cQiya77pCjDqQtEIlRoCNgHcBYQkMXKlUNgCdB23PxXDKkOdv37MKdVrMYLukOeGEERrXYd39Q6mCPyPa2gtPTRBA7TCHIWwlEIibXn5I8FxjMP0Eaj01F3pM+3iMrMkMZ2NC-Is4i19Q7AsHMOi8S1rbQma7JuFnGs72gS6axQp+4bshnmIeMerjOymBBZywhfmeIR7UupFtpbK8r22JEPKNvJYwapASmrCLi3L7lrCovmFlFK071kqjgxi-G8nt9LuouDMBE9JKJ7HB3lIZFYeE99FDuGBoNgMNREdonnY0T4MVjqCFUT8EvCwHhiLBIBh2PJhoQYcMEBh1nM3izVCAec9tvy7PyNnBYttynZTny8LBnKSkWd+FKDnzSkyAtt0gcyZrbG8XhR1QI0nqwQJ2dMeIavGI4ZIYLi7GEXX9LhhMShiChxQ88mERaEYFjMFs-fxXbMgA
clear;

U1 = 80;
U2 = 120;
R1 = 350;
R2 = 650;
R3 = 410;
R4 = 130;
R5 = 360;
R6 = 750;
R7 = 310;
R8 = 190;

% Simplify the circuit
U12 = U1 + U2;
R78 = R7 + R8;

R56 = (1/R5 + 1/R6)^-1;

% Delta - wye transformation
S = R3 + R4 + R56;
Ra = (R3 * R56)/S;
Rb = (R3 * R4)/S;
Rc = (R4 * R56)/S;

R1a = R1 + Ra;
R2b = R2 + Rb;
R1a2b = (1/R1a + 1/R2b)^-1;

% Calculate the current
Rekv = R1a2b + Rc + R78;
U = U12;
I = U/Rekv;

% Find UR2 and IR2
UR1a2b = I * R1a2b;
UR2b = UR1a2b;
UR2 = (UR2b * R2)/(R2 + Rb);
IR2 = UR2 / R2;

disp('Results:');
fprintf("UR2: %.4f V\n", UR2);
fprintf("IR2: %.4f mA\n", IR2 * 10^3);
