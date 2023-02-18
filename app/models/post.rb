class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, {length: {minimum: 250}}
    validates :summary, {length: {maximum: 250}}
    validates :category, {inclusion: {in: %w(Fiction Non-Fiction)}}

    validate :needs_clickbait


    MORE_CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
    def needs_clickbait
        
            if MORE_CLICKBAIT.none? {|clickbait| clickbait.match title }
                # byebug
                errors.add(:title, "Needs more clickbait")
            end
        
    end

end
