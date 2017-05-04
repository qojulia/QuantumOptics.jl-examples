using QuantumOptics
basis = PositionBasis(-3, 3, 200)
x = position(basis)
p = momentum(basis)
H = p^2/4 + 2*full(x^2)
ψ0 = gaussianstate(basis, 5, 0, 1)
energies, states = eig((H+dagger(H))/2, 1:5)

using PyPlot
xpoints = samplepoints(basis)
plot(xpoints, xpoints.^2)
fill_between(xpoints, 0., xpoints.^2, alpha=0.5)
for i=1:length(states)
    plot(xpoints, abs2(states[i].data)*40 + energies[i])
end
xlabel("Position")
ylabel("Energy")
tight_layout()
savefig("particle.svg")