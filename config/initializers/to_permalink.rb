require 'iconv'

class String
 # def to_permalink
 #    (Iconv.new('US-ASCII//TRANSLIT', 'utf-8').iconv self).gsub(/[^\w\s\-\â€”]/,'').gsub(/[^\w]/,' ').split.join('-').downcase  
 #  end
end