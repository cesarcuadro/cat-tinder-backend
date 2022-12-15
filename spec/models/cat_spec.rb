require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create
    expect(cat.errors[:name]).to_not be_empty
    expect(cat.errors[:age]).to_not be_empty
    expect(cat.errors[:enjoys]).to_not be_empty
    expect(cat.errors[:image]).to_not be_empty
  end

  it 'enjoys is less than 10 characters' do
    cat = Cat.create enjoys: 'me like'
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
