require "first/gem/version"

module First
  module Gem
    class Food
     def self.portray(food)
      if food.downcase == "broccoli"
        "Gross!"
      else
        "Delicious!"
      end
    end
  end
 end
end
