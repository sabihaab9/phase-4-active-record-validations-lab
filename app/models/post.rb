class Post < ApplicationRecord

#validates isn a helper method call 

    #validates :attribute_name, helper_name: {hash-of-options}
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    #call the #validate method
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
      ]

      def clickbait?
        if      CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end
    
end

