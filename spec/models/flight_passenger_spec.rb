require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it {should belong_to :flight}
  it {should belong_to :passenger}
end
