200.times do |i|
  Bourbon.create(
    name: "Jim Beam #{i}",
    proof: 80,
    distillery: "Brown-Formen",
    varietal: "Blended"
  )
end

User.create(username: 'admin', email: 'admin@admin.com', password: 'password',
  password_confirmation: 'password', role: 'admin')
