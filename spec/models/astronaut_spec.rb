require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  before :each do
    @astro = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astro_2 = Astronaut.create!(name: 'Amelia Airheart', age: 45, job: 'Pilot')
    @astro_3 = Astronaut.create!(name: 'Gordon Ramsey', age: 32, job: 'Chef')
  end

  it 'can calculate the average age of astronauts' do
    expect(Astronaut.average_age).to eq((@astro.age + @astro_2.age + @astro_3.age)/Astronaut.count)
  end
end
