class Link < ApplicationRecord
  validates :path, presence: true
  validates_format_of :path, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  before_create :set_name
  after_create :check_path

  private

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
    end
  end

  def link_name_setting
    LinkNameSetting.first
  end

  def check_path
    unless self.path[/^https?:\/\//]
      self.path = "http://#{self.path}"
      self.save
    end
  end
end
