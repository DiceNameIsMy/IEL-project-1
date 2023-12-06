% simulation: https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxABZIQkLsaBTAWjDACgA3cMFEbNbrx54ooquATUpUaAjYAnQeBQiUKCspHU0kNgHcQajcL7ZCmqAtPmT2M4fWidVu+aPW+A6gkn6P-agowcwDLRSC3RwjPaTBfA1cYhw1Q3UV3UPd3akJCNOSC9xNtOD9o9wo8bUddA2jQyupUtgAHSiqCxqT6KTZsDCb7CuCCiF7+6pSBVl5QscsAD0NsCGDtQlXCeg1HACUUNiWwPCRWJBQ47hEdjV32JewKYw2+DGeNG5BdikPl7QR6ER-uZPrtsL9HjsEOR+js8pRDLc5EsKI4UAgPhjDNCEXtCJwQExEhRiOYifZsHgNNJxDhoP1RFJZFZySEqYSwMRZuztMdoD9FCwuXx2ULeCTzNQ4rUOcLKRoWCoRdS-GLKKSOUqJZY2oqRPLNdcNT1LBNZeKNaz1TZGb8mKosWpseRQfilvaHeQmAhVPDQcjCWheOj6CwMMGECDEV9we68CJghBvQnCB9o987epyGdA2Bs8dcbd7oHIJtqGHNtt0wczUw0PqBESBHNbbWNe4WJFjLa2pVOg2mraDJ2kn3msORhVVDUWfWCnX8BYSvkFwOS9PqSBcjKmMbG3Px4S9+WRs1Be3HLuQl4aL5zzYlVeCsvVXOTE-iiy5o+30qX1wmyaRtvy0MQpUkRkZDkM0ZmtQl+Dg+ZdDaPM2WMDAQWNIclG1VC4JlWCDTwg0VwQoieGVUQzDwfkCSbOD6JIsCQDpBlpBgOQDEI9lYO1XQgA

clear;

U1 = 150;
R1 = 200;
R2 = 200;
R3 = 660;
R4 = 200;
R5 = 550;
R6 = 150;

R_thevenin = thevenin_resistance(R1, R2, R3, R4, R5);
U_thevenin = thevenin_voltage(U1, R1, R2, R3, R4, R5);

Rekv = R_thevenin + R6;
I = U_thevenin / Rekv;
IR6 = I;
UR6 = I * R6;

disp('Results:');
fprintf('UR6 = %.4f V\n', UR6);
fprintf('IR6 = %.4f A\n', IR6);


function R_thevenin = thevenin_resistance(R1, R2, R3, R4, R5) 
    R23 = R2 + R3;
    R123 = (1/R1 + 1/R23)^-1;    
    R1234 = R123 + R4;
    R12345 = (1/R1234 + 1/R5)^-1;

    R_thevenin = R12345;
end

function U_thevenin = thevenin_voltage(U1, R1, R2, R3, R4, R5)
    R23 = R2 + R3;
    R45 = R4 + R5;
    R2345 = (1/R23 + 1/R45)^-1;
    R12345 = R1 + R2345;
    
    I = U1 / R12345;

    UR2345 = I * R2345;
    UR45 = UR2345;

    IR45 = UR45 / R45;
    IR5 = IR45;

    U5 = IR5 * R5;

    U_thevenin = U5;
end
