require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
  end

  it 'visits movie show page, sees movie title, creation year and genre with actors listed by age' do
    studio1 = Studio.create!(name: "Universal Studios", location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Pirates', creation_year: 2005, genre: 'Adventure')
    johnny_depp = movie1.actors.create!(name: 'Johnny Depp', age: 58)
    kiera_knightey = movie1.actors.create!(name: 'Kierra Knightley', age: 36 )
    movieactor1 = MovieActor.create!(movie_id: movie1.id, actor: johnny_depp, actor: kiera_knightey)

    visit "movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)
    expect(page).to have_content(johnny_depp.name)
    expect(page).to have_content(kiera_knightey.name)

    # Below is the average age of these two actors
    expect(page).to have_content(47)

    ## I do not know how to do the actors by age without using ordelry and instead using CSS. Can you help me??
  end
end
