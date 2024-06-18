# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "seedの実行を開始しました"

## テストデータ用
# デフォルトのユーザーを作成（10ユーザー）
Justin = User.find_or_create_by!(email: "justin@example.jp") do |user|
  user.name = "ジャスティン"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

Sara = User.find_or_create_by!(email: "Sara@example.jp") do |user|
  user.name = "サラ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

Lucas = User.find_or_create_by!(email: "lucas@example.jp") do |user|
  user.name = "ルーカス"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Selena = User.find_or_create_by!(email: "selena@example.jp") do |user|
  user.name = "セレナ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

Tom = User.find_or_create_by!(email: "tom@example.jp") do |user|
  user.name = "トム"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

Risa = User.find_or_create_by!(email: "risa@example.jp") do |user|
  user.name = "リサ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

James = User.find_or_create_by!(email: "james@example.jp") do |user|
  user.name = "ジェームズ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

Alice = User.find_or_create_by!(email: "alice@example.jp") do |user|
  user.name = "アリス"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

Eito = User.find_or_create_by!(email: "eito@example.jp") do |user|
  user.name = "瑛人"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

Asami = User.find_or_create_by!(email: "asami@example.jp") do |user|
  user.name = "麻美"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

# デフォルトの投稿を作成（10件）
Post.find_or_create_by!(name: "テストCafe") do |post|
  post.caption = "充電可能なコンセントと無料Wi-Fiが備わっているのと、カフェラテが美味しかったので、とても作業が捗りました。"
  post.address = "東京都世田谷区"
  post.user = Justin
end

Post.find_or_create_by!(name: "緑Cafe") do |post|
  post.caption = "観葉植物に囲まれていて、いい感じの曲が流れていて、とても集中して学習を行うことができました。"
  post.address = "東京都杉並区"
  post.user = Sara
end

Post.find_or_create_by!(name: "青びん珈琲") do |post|
  post.caption = "無料のWi-Fiが時間制限なしで使えるため、3時間も滞在して作業を行なってしまいました。"
  post.address = "大阪府堺市"
  post.user = Lucas
end

Post.find_or_create_by!(name: "緑の丘") do |post|
  post.caption = "晴れた日には市内を一望できるので、気分よく学習を行うことができる場所でした。"
  post.address = "富山県富山市"
  post.user = Selena
end

Post.find_or_create_by!(name: "Amazing Summer Cafe") do |post|
  post.caption = "店内がとても明るかったので、気分よく作業を行うことができる場所でした。"
  post.address = "北海道釧路市"
  post.user = Tom
end

Post.find_or_create_by!(name: "庭Cafe") do |post|
  post.caption = "綺麗な庭園を眺めながら作業ができたので、とても過ごしやすかったです。"
  post.address = "宮城県仙台市"
  post.user = Risa
end

Post.find_or_create_by!(name: "ノマドWork") do |post|
  post.caption = "時間単位で料金が発生してしまいますが、コンセントと無料Wi-Fiがあり、リモート会議ができる個室などがあって、1日中作業ができるコアワーキングスペースです。"
  post.address = "広島県廿日市"
  post.user = James
end

Post.find_or_create_by!(name: "不思議の森コーヒー") do |post|
  post.caption = "広い店内でテーブル席と1人席には充電可能なコンセントがあって、無料で使えるWi-Fiがあるので、落ち着いて作業することができます。"
  post.address = "福岡県北九州市"
  post.user = Alice
end

Post.find_or_create_by!(name: "777 Lounge") do |post|
  post.caption = "晴れた日には開放感抜群の景色が広がるお店で、外を見るだけで気分転換になりました。"
  post.address = "愛媛県大洲市"
  post.user = Eito
end

Post.find_or_create_by!(name: "Galette") do |post|
  post.caption = "おしゃれなで広々とした店内で、とても過ごしやすいところでした。"
  post.address = "東京都渋谷区"
  post.user = Asami
end


## 管理者ログイン用
admin_email = ENV["ADMIN_EMAIL"]
admin_password = ENV["ADMIN_PASSWORD"]

Admin = Admin.find_or_create_by!(email: admin_email) do |user|
  user.password = admin_password
end

puts "seedの実行が完了しました"
