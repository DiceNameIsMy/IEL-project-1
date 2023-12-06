% simulation: https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxGySQBZsQEBTAWjDACgB3EWlEPSCoTx8BkToOEpqAniCmjxhaXOUZI1FQq5qN-EEoF6xXA5v3LcG492y9LN3vKhsATg5HnDoinleePpk4yvm6yerJB9GKhtmaBygLYGH4IKML2pvYCaWwAbu72qenqUKXKrEjeMAhsAJYgOmaNRlDQxHUSZthCHqLQhGwAHtzUGmDUxNwYY6ncKiAASuzDCNTChLwIGOs08wsoQ-oIAuPremAIEBpSi9iHq4RymPQYjyi4czcL1IeEcHLEXiED4oYi7L41YYTa54R6XCBpSbXDQAVUOSUm4w02FI4Go5GRIAAkssGhc8UgcEhTp8NESDkA

clear;

U = 115;
I1 = 0.6;
I2 = 0.9;
R1 = 50;
R2 = 38;
R3 = 48;
R4 = 37;
R5 = 28;

syms Ua Ub Uc
Ua_node_equation = I1 + (Ub - Ua)/R2 - Ua/R1;
Ub_node_equation = I2 + (Uc - Ub)/R3 - (Ub - Ua)/R2;
Uc_node_equation = (U - Uc)/R5 - I2 - (Uc - Ub)/R3 - Uc/R4;

[A, B] = equationsToMatrix([Ua_node_equation, Ub_node_equation, Uc_node_equation], [Ua, Ub, Uc]);

node_voltages = linsolve(A,B);

Ua = node_voltages(1, 1);
Ub = node_voltages(2, 1);
Uc = node_voltages(3, 1);

U_R4 = Uc;
I_R4 = U_R4 / R4;

disp('Results:');
fprintf('UR4 = %.4f V\n', U_R4);
fprintf('IR4 = %.4f A\n', I_R4);

