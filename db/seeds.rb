# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies, books, games, languages = Category.create!([
{ title: 'Movies' },
{ title: 'Books' },
{ title: 'Games' },
{ title: 'Languages' }])

pavel, teachbase, thinknetica = User.create!([
{ first_name: 'Pavel', last_name: 'Mirov', email: 'pavlooo987@gmail.com', username: 'Pavlooid', password: '123456', type: 'Admin' },
{ first_name: 'teach', last_name: 'base', email: 'info@teachbase.ru', username: 'Teachbase', password: '123456' },
{ first_name: 'think', last_name: 'netica', email: 'learn@thinknetica.com', username: 'Thinknetica', password: '123456' }])

star_wars, harry_potter, war_and_piece, ruby, sql = Test.create!([
{ title: 'Star Wars', level: 3, category: movies, author: pavel },
{ title: 'Harry Potter', level: 1, category: movies, author: teachbase },
{ title: 'War and Piece', level: 4, category: books, author: thinknetica },
{ title: 'Ruby', level: 7, category: languages, author: pavel },
{ title: 'SQL', level: 0, category: languages, author: teachbase }])

star_wars_chapters, war_and_piece_story, ruby_question, ruby_usage = Question.create!([
{ title: 'Star Wars chapters', question: 'How many chapters exist?', test: star_wars },
{ title: 'War And Piece story', question: 'What person was present in the novel?', test: war_and_piece },
{ title: 'Ruby', question: 'Is Ruby a compiled language or not?', test: ruby },
{ title: 'Ruby usage', question: 'Are operators in Ruby overrideble?', test: ruby }])

answer1_t, answer1_f, answer2_t, answer2_f, answer3_t, answer3_f, answer4_t, answer4_f = Answer.create!([
{ body: 'More or equal then 36', correct: true, question: star_wars_chapters },
{ body: 'Less than 36', correct: false, question: star_wars_chapters },
{ body: 'Alexander I', correct: true, question: war_and_piece_story },
{ body: 'Alexander II', correct: false, question: war_and_piece_story },
{ body: 'Yes', correct: true, question: ruby_question },
{ body: 'No', correct: false, question: ruby_question },
{ body: 'Yes', correct: true, question: ruby_usage },
{ body: 'No', correct: false, question: ruby_usage }])

at_first_try, all_tests_of_the_same_level, all_tests_of_similar_category = Rule.create!([
{ body: 'at_first_try' },
{ body: 'all tests of the same level' },
{ body: 'all tests of similar category' }])
