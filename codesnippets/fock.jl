using QuantumOptics
b = FockBasis(50)
a = destroy(b)
at = create(b)
H = 0.5*(a^2 + at^2)
psi0 = fockstate(b, 3)
tout, psit = timeevolution.schroedinger([0:0.25:1;], psi0, H)

using PyPlot
x = [-5:0.1:5;]
for i in 1:4
    subplot(2, 2, i)
    Q = qfunc(psit[i], x, x)
    pcolor(x, x, Q)
end
tight_layout()
savefig("fock.png")