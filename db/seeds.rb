# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
