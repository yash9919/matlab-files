load PvsMER.mat
semilogy(lambdas,secrecy_outage_probability(1:7));
hold on
semilogy(lambdas,secrecy_outage_probability(8:14));
hold on
semilogy(lambdas,secrecy_outage_probability(15:21));
hold off