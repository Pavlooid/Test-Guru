# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies, books, games, languages = Category.create([
{ title: 'Movies' },
{ title: 'Books' },
{ title: 'Games' },
{ title: 'Languages' }])

pavel, teachbase, thinknetica = User.create([
{ first_name: 'Pavel', last_name: 'Mirov', email: 'pavlooo987@gmail.com', username: 'Pavlooid' },
{ first_name: 'teach', last_name: 'base', email: 'info@teachbase.ru', username: 'Teachbase' },
{ first_name: 'think', last_name: 'netica', email: 'learn@thinknetica.com', username: 'Thinknetica' }])

star_wars, harry_potter, ruby_for_romantics, war_and_piece, mass_effect, resident_evil, ruby, sql = Test.create([
{ title: 'Star Wars', level: 3 },
{ title: 'Harry Potter', level: 1 },
{ title: 'Ruby for Romantics', level: 3 },
{ title: 'War and Piece', level: 4 },
{ title: 'Mass Effect', level: 1 },
{ title: 'Resident Evil', level: 2 },
{ title: 'Ruby', level: 3 },
{ title: 'SQL', level: 0 }])

star_wars_chapters, war_and_piece_story, resident_evil_plot, ruby_usage = Question.create([
{ title: 'Star Wars chapters', question: 'How many chapters exist?' },
{ title: 'War And Piece story', question: 'Which option is correct?' },
{ title: 'Resident Evil plot', question: 'Which option is correct?' },
{ title: 'Ruby usage', question: 'Which option is correct?' }])

answer1_t, answer1_f, answer2_t, answer2_f, answer3_t, answer3_f, answer4_t, answer4_f = Answer.create([
{ body: '=> 36', correct: 'true' },
{ body: '< 36', correct: 'false' },
{ body: '2', correct: 'true' },
{ body: '1, 3, 4', correct: 'false' },
{ body: '4', correct: 'true' },
{ body: '1, 2, 3', correct: 'false' },
{ body: '3', correct: 'true' },
{ body: '1, 2, 4', correct: 'false' }])
