require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date) }
    end

    describe "#duration" do
      it { expect(@event).to validate_presence_of(:duration) }
    end

    describe "#title" do
      it { expect(@event).to validate_presence_of(:title) }
      it { expect(@event).to validate_length_of(:title).is_at_least(5) }
    end

    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) }
      it { expect(@event).to validate_length_of(:description).is_at_least(20) }
    end

    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) }
      it { expect(@event).to validate_length_of(:price).is_at_least(1) }
    end

    describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }
    end
    
  end

end