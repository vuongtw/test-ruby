require './base.rb'

# GC enabled
# ruby type_checking.rb

# GC disabled
# ruby type_checking.rb --no-gc

module Types
  include Dry.Types()
 end

class User < Dry::Struct
  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Integer.constrained(gteq: 18)
end

class BareUser
  def initialize(name:, age:)
    @age = age.to_int
    raise ArgumentError, "Age should be greater than or equal to 18" if age < 18
    @name = name.to_str
  end
end

max = 100000

measure do
  a = []
  18.upto(max) { |i|
    a << User.new(name: "Name-#{i}", age: i + 18)
  }
end

measure do
  a = []
  18.upto(max) { |i|
    a << BareUser.new(name: "Name-#{i}", age: i + 18)
  }
end
