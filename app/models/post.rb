class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
      if self.title && self.title.include?("Won't Believe") 
          true  
      else
          errors.add(:title, "Not Clickbait")
    end  
  end 
end
