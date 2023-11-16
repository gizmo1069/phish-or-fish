class Scam < ActiveRecord::Base
    belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true

    def self.all_categories
        ['email', 'phone', 'social media']
    end

    def self.with_categories(categories)
        if categories.nil?
            all
        else
            where(category: categories.map(&:downcase))
        end
    end
end