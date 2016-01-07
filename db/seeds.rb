200.times do |i|
  Bourbon.create(
    name: "Jim Beam #{i}",
    proof: 80,
    distillery: "Brown-Formen",
    varietal: "Blended"
  )
end
