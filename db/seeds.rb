@user = User.create(
  username: 'admin2', email: 'admin2@admin.com', password: 'password',
  password_confirmation: 'password', role: 'admin')

200.times do |i|
  Bourbon.create(
    name: "Jim Beam #{i}",
    proof: 80,
    distillery: "Brown-Formen",
    varietal: "Blended",
    user_id: @user.id
  )
end
