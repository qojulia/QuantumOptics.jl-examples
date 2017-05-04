using QuantumOptics
b = NLevelBasis(3)
t12 = transition(b, 1, 2)
t23 = transition(b, 2, 3)
t31 = transition(b, 1, 3)
H = 10*(t31 + dagger(t31))
J = [1.2*t23, 0.6*t12]
psi0 = basisstate(b, 1)
T = [0:0.01:10;]
tout, psit = timeevolution.mcwf(T, psi0, H, J; seed=2)

using PyPlot
plot(tout, expect(dm(basisstate(b, 3)), psit), label=L"$|3\rangle$")
plot(tout, expect(dm(basisstate(b, 2)), psit), label=L"$|2\rangle$")
plot(tout, expect(dm(basisstate(b, 1)), psit), label=L"$|1\rangle$")
xlabel("Time")
ylabel("Probability")
legend()
tight_layout()
savefig("nlevel.svg")