module LinkName
  extend ActiveSupport::Concern

  included do
    before_create :set_name
  end

  def set_name
    self.name = create_link_name
  end

  def create_link_name
    check_name_variations_left

    valid_name = false
    while valid_name == false
      randomized_name = random_name(link_name_setting.length,
                                    link_name_setting.characters)
      if Link.find_by(name: randomized_name).blank?
        valid_name = true
        link_name = randomized_name
      end
    end
    link_name
  end

  def random_name(length, chars)
    name = ''
    length.times { name << chars[rand(chars.size)] }
    name
  end

  def check_name_variations_left
    if Link.count == link_name_setting.variations
      link_name_setting.length += 1
      link_name_setting.variations = link_name_setting.
                                     characters ** link_name_setting.length
      link_name_setting.save
    end
  end

  def link_name_setting
    LinkNameSetting.first
  end
end
