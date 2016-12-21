require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:path) }
  it { should allow_value('http://foo.com', 'football.ua').for(:path) }
  it { should_not allow_value('foocom', 'hht://football.ua').for(:path) }
end
