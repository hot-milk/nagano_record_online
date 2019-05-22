# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
	last_name: '田中',
	first_name: '太郎',
	ruby_last_name: 'タナカ',
	ruby_first_name: 'タロウ',
	postcode: '1000000',
	address: '東京都渋谷区Webcamp町0-0-0',
	phone: '00000000000',
	email: 'tanaka.taro@example.com',
	password: 'tanakataro',
	admin: 'true'
	)

Genre.create(genre_name: 'J-POP')
Genre.create(genre_name: '洋楽')
Genre.create(genre_name: 'K-POP')
Genre.create(genre_name: 'ロック/オルタナティブ')
Genre.create(genre_name: 'パンク/ハードコア')
Genre.create(genre_name: 'ビジュアル')
Genre.create(genre_name: 'R&B')
Genre.create(genre_name: 'ヒップホップ')
Genre.create(genre_name: 'ダンス/ハウス/テクノ')
Genre.create(genre_name: 'レゲエ/スカ')
Genre.create(genre_name: 'アイドル')
Genre.create(genre_name: 'アニメ/ゲーム')
Genre.create(genre_name: 'ワールドミュージック')
Genre.create(genre_name: 'ライブ/フェス')
Genre.create(genre_name: 'カラオケ')
Genre.create(genre_name: '歌詞')
Genre.create(genre_name: 'DJ/CLUB')
Genre.create(genre_name: 'DANCE')
Genre.create(genre_name: 'バンド/ライブハウス')
Genre.create(genre_name: 'アプリ/WEBサイト')
Genre.create(genre_name: '楽器/機材')
Genre.create(genre_name: 'ボーカロイド')
Genre.create(genre_name: '作詞作曲')
Genre.create(genre_name: '映画音楽')
Genre.create(genre_name: 'TV/CM')
Genre.create(genre_name: '音楽一般')
Genre.create(genre_name: 'その他')

20.times do
	Artist.create(
		artist_name: Faker::Music.band
		)
end

20.times do
	Label.create(
		label_name: Faker::Music.band
		)
end

50.times do
     Product.create(
        product_name: Faker::Music.album,
        product_category: 'シングル',
        artist_id: Faker::Number.within(1..20),
        genre_id: Faker::Number.within(1..28),
        label_id: Faker::Number.within(1..20),
        price: Faker::Number.within(1000..5000),
        stock: Faker::Number.within(10..500),
        status: '販売中'
      )
end