admin = User.create(
  username: 'admin', email: 'admin@admin.com', password: 'crodevdictob',
  password_confirmation: 'crodevdictob', role: 'admin')

user1 = User.create(
  username: 'craigmd', email: 'craigmd@admin.com', password: 'crodevdictob',
  password_confirmation: 'crodevdictob'
)

user2 = User.create(
  username: 'rakkofat', email: 'rakkofat@admin.com', password: 'crodevdictob',
  password_confirmation: 'crodevdictob'
)

user3 = User.create(
  username: 'crowlebf', email: 'crowlebf@admin.com', password: 'crodevdictob',
  password_confirmation: 'crodevdictob'
)

user4 = User.create(
  username: 'tobara', email: 'tobara@admin.com', password: 'crodevdictob',
  password_confirmation: 'crodevdictob'
)

Bourbon.create(
  user_id: user1.id,
  name: "Bulleit Bourbon 10 Year",
  proof: "91.2",
  distillery: "Diageo"
)

Bourbon.create(
  user_id: user1.id,
  name: "Larceny",
  proof: "92",
  distillery: "Old Fitzgerald Distillery"
)

Bourbon.create(
  user_id: user1.id,
  name: "Four Roses Small Batch",
  proof: "90",
  distillery: "Four Roses Distillery"
)

Bourbon.create(
  user_id: user1.id,
  name: "1792",
  proof: "93.75",
  distillery: "Barton 1792 Distillery"
)

Bourbon.create(
  user_id: user1.id,
  name: "Basil Hayden's",
  proof: "80",
  distillery: "Louisville Distilling"
)

Bourbon.create(
  user_id: user2.id,
  name: "Heaven Hill Fighting Cock",
  proof: "103",
  distillery: "Heaven Hill Distilleries"
)

Bourbon.create(
  user_id: user2.id,
  name: "Knob Creek",
  proof: "100",
  distillery: "Beam Suntory"
)

Bourbon.create(
  user_id: user2.id,
  name: "Old Forester Classic",
  proof: "86",
  distillery: "Brown-Forman"
)

Bourbon.create(
  user_id: user2.id,
  name: "Blanton’s Original Single Barrel",
  proof: "93",
  distillery: "Buffalo Trace Distillery"
)

Bourbon.create(
  user_id: user2.id,
  name: "Pappy Van Winkle 15 Year Old Family Reserve",
  proof: "107",
  distillery: "Old Rip Van Winkle Distillery"
)

Bourbon.create(
  user_id: user3.id,
  name: "Eagle Rare Single Barrel",
  proof: "90",
  distillery: "Eagle Rare"
)

Bourbon.create(
  user_id: user3.id,
  name: "Rowan's Creek",
  proof: "101",
  distillery: "Kentucky Bourbon Distillers"
)

Bourbon.create(
  user_id: user3.id,
  name: "Black Maple Hill 21 Cask 7",
  proof: "95",
  distillery: "Willet Distilling Company"
)

Bourbon.create(
  user_id: user3.id,
  name: "Belle Meade Sherry Cask Finish",
  proof: "90",
  distillery: "Nelson's Green Brier Distillery"
)

Bourbon.create(
  user_id: user3.id,
  name: "William Larue Weller",
  proof: "135.5",
  distillery: "Buffalo Trace Distillery"
)

Bourbon.create(
  user_id: user4.id,
  name: "Ascendant Breaker",
  proof: "90",
  distillery: "Ascendant Spirits"
)

Bourbon.create(
  user_id: user4.id,
  name: "Woodford Reserve Double Oaked",
  proof: "90.4",
  distillery: "Woodford Reserve Distillery"
)
Bourbon.create(
  user_id: user4.id,
  name: "James E. Pepper 1776 Straight",
  proof: "100",
  distillery: "James E. Pepper"
)

Bourbon.create(
  user_id: user4.id,
  name: "Ballast Point Devil's Share",
  proof: "92",
  distillery: "Ballast Point Brewing"
)

Bourbon.create(
  user_id: user4.id,
  name: "Widow Jane Bourbon",
  proof: "91",
  distillery: "Widow Jane"
)

Bourbon.create(
  user_id: user4.id,
  name: "Angel's Envy",
  proof: "86",
  distillery: "Louisville Distilling"
)
