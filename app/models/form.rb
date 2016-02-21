class Form < ActiveRecord::Base
  belongs_to :user
  before_create :generate_uuid
  validates :name, presence: true, length: {minimum: 5}
  
  enum status: {archived: 0, published: 100}
  
  private
  def generate_uuid
    self.uuid = SecureRandom.hex(5)
  end
end
