FactoryGirl.define do
  factory :link_name_setting do
    characters 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    length 5
    variations 57 ** 5
  end
end
