
module C
module T
  @@foo = 'bar'

  def self.set(x)
    @@foo = x
  end

  def self.get
    @@foo
  end
end
end 
puts C::T.get         #=> 'bar'
C::T.set('fubar')
puts C::T::get        #=> 'fubar'
