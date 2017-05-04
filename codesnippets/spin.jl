using QuantumOptics
b = SpinBasis(3//2)
sm = sigmam(b)
H = 2*sigmaz(b)
J = [sm]
τ = [0:0.025:5;]
ω = [-5:0.05:25;]
ρ0 = dm(spinup(b))
corr = timecorrelations.correlation(τ, ρ0, H, J, sigmap(b), sm)
ω, S = timecorrelations.spectrum(ω, H, J, sm)

using PyPlot
subplot(2, 1, 1)
plot(τ, corr)
xlabel(L"\tau")
ylabel(L"\langle \sigma_+(\tau) \sigma_-(0)\rangle")
subplot(2, 1, 2)
plot(ω, S)
xlabel(L"\omega")
ylabel(L"S(\omega)")
tight_layout()
savefig("spin.svg")