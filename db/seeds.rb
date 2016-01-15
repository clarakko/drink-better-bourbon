admin = User.create(
  username: 'admin', email: 'admin@admin.com', password: 'password',
  password_confirmation: 'password', role: 'admin')

50.times do |i|
  Bourbon.create(
    user_id: admin.id,
    name: "Elegant Firewater #{i}",
    proof: 160,
    distillery: "House of Bourbon"
  )
end
