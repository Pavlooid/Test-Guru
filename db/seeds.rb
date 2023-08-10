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
{ first_name: 'Pavel', last_name: 'Mirov', email: 'pavlooo987@gmail.com', username: 'Pavlooid' },
{ first_name: 'teach', last_name: 'base', email: 'info@teachbase.ru', username: 'Teachbase' },
{ first_name: 'think', last_name: 'netica', email: 'learn@thinknetica.com', username: 'Thinknetica' }])

star_wars, harry_potter, ruby_for_romantics, war_and_piece, mass_effect, resident_evil, ruby, sql = Test.create!([
{ title: 'Star Wars', level: 3, category_id: movies.id, user_id: pavel.id },
{ title: 'Harry Potter', level: 1, category_id: movies.id, user_id: teachbase,id },
{ title: 'Ruby for Romantics', level: 3, category_id: books.id, user_id: teachbase.id },
{ title: 'War and Piece', level: 4, category_id: books.id, user_id: thinknetica.id },
{ title: 'Mass Effect', level: 1, category_id: games.id, user_id: pavel.id },
{ title: 'Resident Evil', level: 2, category_id: games.id, user_id: pavel.id },
{ title: 'Ruby', level: 3, category_id: languages.id, user_id: pavel.id },
{ title: 'SQL', level: 0, category_id: languages.id, user_id: teachbase.id }])

star_wars_chapters, war_and_piece_story, resident_evil_plot, ruby_usage = Question.create!([
{ title: 'Star Wars chapters', question: 'How many chapters exist?', test_id: star_wars.id },
{ title: 'War And Piece story', question: 'Which option is correct?', test_id: war_and_piece.id },
{ title: 'Resident Evil plot', question: 'Which option is correct?', test_id: resident_evil.id },
{ title: 'Ruby usage', question: 'Which option is correct?', test_id: ruby.id }])

answer1_t, answer1_f, answer2_t, answer2_f, answer3_t, answer3_f, answer4_t, answer4_f = Answer.create!([
{ body: '=> 36', correct: true, question_id: star_wars_chapters.id },
{ body: '< 36', correct: false, question_id: star_wars_chapters.id },
{ body: '2', correct: true, question_id: war_and_piece_story.id },
{ body: '1, 3, 4', correct: false, question_id: war_and_piece_story.id },
{ body: '4', correct: true, question_id: resident_evil_plot.id },
{ body: '1, 2, 3', correct: false, question_id: resident_evil_plot.id },
{ body: '3', correct: true, question_id: ruby_usage.id },
{ body: '1, 2, 4', correct: false, question_id: ruby_usage.id }])

p_1, p_2, p_3, p_4 = PassedTest.create!([
{ user_id: pavel.id, test_id: sql.id, passed: 'passed'},
{ user_id: teachbase.id, test_id: mass_effect.id, passed: 'passed'},
{ user_id: teachbase.id, test_id: harry_potter.id, passed: 'in progress'},
{ user_id: thinknetica.id, test_id: ruby.id, passed: 'passed'}])