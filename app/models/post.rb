class Post < ApplicationRecord
    has_many :comments
    
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    mount_uploader :image, ImageUploader

    def self.tagged_with(name)
        Tag.find_by!(name: name)
    end 

    def all_tags=(names)
        self.tags = names.split(',').map do |name|
            Tag.where(name: name).first_or_create!
        end     
    end
    def all_tags
        tags.map(&:name).join(", ")
    end
    
    def self.search(term)
        if term
            where('title LIKE ?', "%#{term}%").order('id DESC')
        else 
            all.order('id DESC')
        end
    end
        
end
