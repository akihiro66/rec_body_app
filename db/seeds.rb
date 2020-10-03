EMAIL = "guest@example.com"

START_DATE = Date.today - 11.months
END_DATE = Date.today + 11.months

NO_RECORD_CONSTANT = 5

MIN_WEIGHT = 700
MAX_WEIGHT = 730
DIV_CONSTANT = 10

MIN_PEDOMETER = 10000
MAX_PEDOMETER = 200000

user = User.find_or_create_by!(email: EMAIL) do |user|
  user.password = SecureRandom.urlsafe_base64
  puts "テストユーザーの初期データインポートに成功しました。"
end

user.graphs.destroy_all

graphs = []
(START_DATE..END_DATE).each do |date|
  next if rand(NO_RECORD_CONSTANT).zero?
  graphs << {
    user_id: user.id,
    date: date,

    weight: rand(MIN_WEIGHT..MAX_WEIGHT).to_f / DIV_CONSTANT,

    pedometer: rand(MIN_PEDOMETER..MAX_PEDOMETER) / DIV_CONSTANT,
  }
end
Graph.create!(graphs)
puts "ユーザーの初期データ投入に成功しました！"
