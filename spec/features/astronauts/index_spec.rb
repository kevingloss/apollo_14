require 'rails_helper'

RSpec.describe 'astronaut index page' do
  before :each do
    @astro = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astro_2 = Astronaut.create!(name: 'Amelia Airheart', age: 45, job: 'Pilot')
    @astro_3 = Astronaut.create!(name: 'Gordon Ramsey', age: 32, job: 'Chef')

    @mission = Mission.create!(title: 'Mars', time_in_space: 7)
    @mission_2 = Mission.create!(title: 'Jupiter', time_in_space: 10)
    @mission_3 = Mission.create!(title: 'Moon', time_in_space: 3)

    AstronautMission.create!(astronaut: @astro, mission: @mission)
    AstronautMission.create!(astronaut: @astro, mission: @mission_2)
    AstronautMission.create!(astronaut: @astro_2, mission: @mission)
    AstronautMission.create!(astronaut: @astro_2, mission: @mission_2)
    AstronautMission.create!(astronaut: @astro_2, mission: @mission_3)
    AstronautMission.create!(astronaut: @astro_3, mission: @mission)
    AstronautMission.create!(astronaut: @astro_3, mission: @mission_3)
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

  it 'has a list of each astronauts missions in alphabetical order' do
    visit '/astronauts'

    within "#astronaut-#{@astro.id}" do
      expect(@mission_2.title).to appear_before(@mission.title)
    end

    within "#astronaut-#{@astro_2.id}" do
      expect(@mission_2.title).to appear_before(@mission.title)
      expect(@mission.title).to appear_before(@mission_3.title)
    end
  end

  it 'can add a mission to the astronaut list of missions' do
    visit '/astronauts'

    within "#astronaut-#{@astro.id}" do
      fill_in(:search, with: 'moon')
      click_button("Search")

      expect(page).to have_content(@mission_3.title)
      expect(current_path).to eq('/astronauts')
    end
  end
end
