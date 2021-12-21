require 'rails_helper'

RSpec.describe 'astronaut index page' do
  before :each do
    @astro = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astro_2 = Astronaut.create!(name: 'Amelia Airheart', age: 45, job: 'Pilot')
    @astro_3 = Astronaut.create!(name: 'Gordon Ramsey', age: 32, job: 'Chef')
  end

  it 'has a list of astronauts and their attributes' do
    visit '/astronauts'

    within "#astronaut-#{@astro.id}" do
      expect(page).to have_content(@astro.name)
      expect(page).to have_content(@astro.age)
      expect(page).to have_content(@astro.job)
    end
  end

  it 'has the average age of all astronauts' do
    visit '/astronauts'

    expect(page).to have_content("Average Age: #{Astronaut.average_age}")
  end
end
