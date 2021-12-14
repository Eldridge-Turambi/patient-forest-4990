require 'rails_helper'

RSpec.describe 'Stuido Index Page' do
  before :each do
  end

  it 'visits studio index page and sees the studio name and location' do
    studio1 = Studio.create!(name: "Universal Studios", location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Pirates', creation_year: 2005, genre: 'Adventure')
    visit '/studios'

    expect(current_path).to eq('/studios')
    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
    expect(page).to have_content(movie1.title)
  end
end
