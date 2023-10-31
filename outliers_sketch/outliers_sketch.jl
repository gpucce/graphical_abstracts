### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ a5e7266a-4a1f-11ed-1005-2b4e4e0838b1
begin
	using Pkg
	Pkg.activate(".")
	Pkg.add("Colors")
	using Luxor, Random, MathTeXEngine, Colors
	import CairoMakie
end

# ╔═╡ be16be98-fe88-4d94-8cc8-4ef0e11a5dd9
hsize = 400

# ╔═╡ 674bc9ac-bc97-4101-a4e0-dab397a92cc9
vsize = 340

# ╔═╡ dbb3b946-0181-409f-81f0-6a4d623c1e21
bkgr = "black"

# ╔═╡ 12a0902c-4a6e-4b7b-a77b-e1bb9144e809
antibkgr = bkgr == "black" ? "white" : "black"

# ╔═╡ b1e04f97-627e-4802-bd80-557aa6b7c281
v = @png begin

	background(RGBA(0, 0, 0, 0))
	# background(bkgr)
	# hue = sethue("green")
	# squircle(O - (0, 20), 155, 140, action=:stroke, rt=0.1)
	# setcolor(hue..., 0.2)
	# squircle(O - (0, 20), 155, 140, action=:fill, rt=0.1)
	
	p1 = Point(0, vsize ÷ 2)
	hue = sethue("red")
	squircle(p1-(0, 20), 160, 10, action=:stroke, rt=0.2)
	setcolor(hue..., 0.2)
	squircle(p1-(0, 20), 160, 10, action=:fill, rt=0.2)
	fontsize(15)
	setcolor(antibkgr)
	text("Input Embeddings", p1 - (0, 20), halign=:center, valign=:middle)
	# text("Embeddings", p1 + (0, 15), halign=:center, valign=:middle)

	line(p1 - (20, 50), p1 + (20, -50), action=:stroke)
	arc(p1 - (20, 55), 5, π/2, π, action=:stroke)
	arrow(p1 - (25, 55), p1 - (25, 65), linewidth=2)
	arc(p1 + (20, -55), 5, 0, π/2, action=:stroke)
	arrow(p1 + (25, -55), p1 + (25, -65), linewidth=2)
	
	line(p1 - (0, 40), p1 - (120, 40), action=:stroke)
	arc(p1 - (120, 45), 5, π/2, π, action=:stroke)
	line(p1 - (125, 45), p1 - (125, 95), action=:stroke)
	arc(p1 - (120, 95), 5, π, 3π/2, action=:stroke)
	arrow(p1 - (120, 100), p1 - (10, 100), linewidth=2)
	
	
	p2 = p1 - (0, 95)
	arrow(p2 + (0, 65), p2 + (0, 30))
	squircle(p2 + (0, 20), 100, 10, action=:stroke, rt=0.2)
	setcolor(sethue("orangered")..., 0.5)
	squircle(p2 + (0, 20), 100, 10, action=:fill, rt=0.2)
	setcolor(antibkgr)
	text("Attention", p2 + (0, 20), halign=:center, valign=:middle)
	squircle(p2 - (0, 60), 100, 10, action=:stroke, rt=0.2)
	setcolor(sethue("royalblue")..., 0.5)
	squircle(p2 - (0, 60), 100, 10, action=:fill, rt=0.2)
	setcolor(antibkgr)
	text("Dense", p2 - (0, 60), halign=:center, valign=:middle)
	arrow(p2 + (0, 10), p2 - (0, 50), linewidth=2)
	setcolor(bkgr)
	circle(p2 - (0, 5), 10, action=:fill)
	setcolor(antibkgr)
	circle(p2 - (0, 5), 10, action=:stroke)
	fontsize(20)
	text("+", p2 - (0, 5), halign=:center, valign=:middle)

	

	p4 = p2 + (0, 30)
	line(p4 - (0, 58), p4 - (120, 58), action=:stroke)
	squircle(p4 - (0, 58), 70, 10, action=:stroke, rt=0.2)
	sethue(bkgr)
	squircle(p4 - (0, 58), 70, 10, action=:fill, rt=0.2)
	sethue(antibkgr)
	fontsize(12)
	text("Attention LayerNorm", p4 - (0, 58), halign=:center, valign=:middle)
	strokepath()
	arc(p4 - (120, 63), 5, π/2, π, action=:stroke)
	line(p4 - (125, 63), p4 - (125, 110), action=:stroke)
	arc(p4 - (120, 110), 5, π, 3π/2, action=:stroke)
	arrow(p4 - (120, 115), p4 - (10, 115), linewidth=2)

	p5 = p4 - (0, 150)
	
	arrow(p4 - (0, 100), p5 + (0, 10), linewidth=2)
	setcolor(bkgr)
	circle(p4 - (0, 115), 10, action=:fill)
	setcolor(antibkgr)
	circle(p4 - (0, 115), 10, action=:stroke)
	fontsize(20)
	text("+", p4 - (0, 115), halign=:center, valign=:middle)

	
	
	hue = sethue("red")

	squircle(p5, 70, 10, action=:stroke, rt=0.2)
	fontsize(12)
	text("LayerNorm", p5, halign=:center, valign=:middle)
	setcolor(hue..., 0.2)
	squircle(p5, 70, 10, action=:fill, rt=0.2)
	setcolor(antibkgr)
	

	setline(1)
	setcolor("red")
	box(p5 - (50, 115), p5 + (190, -20), action=:stroke)
	line(p5 - (50, 20), p5 - (70, 10), action=:stroke)
	line(p5 + (190, -20), p5 + (70, -10), action=:stroke)

	setline(2)
	c1 = "red"
	c2 = "royalblue"
	c3 = antibkgr
	some_points_1 = [p5 + (-25 + i, -65+randn()) for i in 1:190]
	some_points_1[102] -= (0, 10)
	some_points_1[149] += (0, 13)
	some_points_2 = [p5 + (-25 + i, -65+randn()) for i in 1:190]
	some_points_2[102] -= (0, 10)
	some_points_2[149] += (0, 13)
	some_points_3 = [p5 + (-25 + i, -65+randn()) for i in 1:190]
	for i in 1:length(some_points_1)-1
		setcolor(sethue(c1)..., 0.5)
		shift1 = (20, 30)
		line(some_points_1[i] - shift1, some_points_1[i+1] - shift1, action=:stroke)
		setcolor(sethue(c2)..., 0.5)
		shift2 = (20, 30)
		line(some_points_2[i] + shift2, some_points_2[i+1] + shift2, action=:stroke)
		setcolor(sethue(c3))
		line(some_points_3[i], some_points_3[i+1], action=:stroke)
	end
	fontsize(20)
	setcolor(sethue(antibkgr)...)
	text(L"\times", p5 + (50, -80), halign=:center, valign=:middle)
	text(L"+", p5 + (70, -50), halign=:center, valign=:middle)
	fontsize(15)
	setcolor(sethue(c1)...)
	text(L"W = \left[w_1, \dots, w_n\right]", p5 - (120, 100), halign=:center, valign=:middle)
	setcolor(sethue(c3)...)
	text(L"\frac{(i-\mu)}{\sigma} = \left[\bar{i}_1, ..., \bar{i}_n\right]", p5 - (120, 70), halign=:center, valign=:middle)
	setcolor(sethue(c2)...)
	text(L"B = \left[b_1, ..., b_n\right]", p5 - (120, 35), halign=:center, valign=:middle)

	
end hsize vsize "outliers_sketch_$(bkgr).png"

# ╔═╡ 0ff53449-0c1c-478f-8f2e-b6733e1778eb
v

# ╔═╡ 962e67bd-a050-4281-88ce-a837029d18a8
@draw begin
origin()
background("grey6")
fontsize(26)
sethue("white")
t₁ = L"e^{i\pi} + 1 = 0"
t₂ = L"e^x = \sum^\infty_{n=0} \frac{x^n}{n!} = \lim_{n\to\infty}(1+\frac{x}{n})^n"
t₃ = L"\cos(\theta)"

text(t₁, Point(0, -100), halign=:center, valign=:baseline, angle=0)
text(t₂, Point(0, -20), halign=:center, valign=:top, angle=0)

line(Point(0, 132), Point(50, 132), action = :stroke)
line(Point(0, 132), Point(50cos(π/4), 132 - 50sin(π/4)), action = :stroke)

fontsize(18)
text(t₃, Point(0, 120), halign = :left, valign = :baseline, angle = -π/4, rotationfixed = false)
finish()
end 600 400

# ╔═╡ 21edfa89-8182-417f-b4bd-3bc4500b9a07
L"Bias: [w_1, ..., w_n]"

# ╔═╡ Cell order:
# ╠═a5e7266a-4a1f-11ed-1005-2b4e4e0838b1
# ╠═be16be98-fe88-4d94-8cc8-4ef0e11a5dd9
# ╠═674bc9ac-bc97-4101-a4e0-dab397a92cc9
# ╠═dbb3b946-0181-409f-81f0-6a4d623c1e21
# ╠═12a0902c-4a6e-4b7b-a77b-e1bb9144e809
# ╠═b1e04f97-627e-4802-bd80-557aa6b7c281
# ╠═0ff53449-0c1c-478f-8f2e-b6733e1778eb
# ╠═962e67bd-a050-4281-88ce-a837029d18a8
# ╠═21edfa89-8182-417f-b4bd-3bc4500b9a07
