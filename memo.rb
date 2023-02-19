require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

while memo_type != 1 && memo_type != 2
  puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
  memo_type = gets.to_i
end

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください。"
  create_file = gets.chomp.to_s
  puts "メモしたい内容を入力してください。"
  puts "完了したらCtrl + Dを押します。"
  contents = readlines
  CSV.open("#{create_file}.csv", "w") do |memo|
    contents.each do |content|
      memo << [content.chomp!]
    end
  end
elsif memo_type == 2
  puts "編集したいファイルの拡張子を除いたファイル名を入力してください。"
  edit_file = gets.chomp.to_s
  puts "メモしたい内容を入力してください。"
  puts "完了したらCtrl + Dを押します。"
  add_contents = readlines
  CSV.open("#{edit_file}.csv", "a") do |add_memo|
    add_contents.each do |add_content|
      add_memo << [add_content.chomp!]
    end
  end
end