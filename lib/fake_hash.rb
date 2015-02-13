class FakeHashWrapper
  require 'pry'

  attr_reader :container
  def initialize
    @container = {}
  end

  def []=(key, value) #hash[key] = value
    container[normalize_key(key)] = value
  end
  
  def [](key) #hash[key]
    container[normalize_key(key)]
  end

  def keys
    container.keys.sort.reverse
  end

  def first_letter(letter)
    found_keys = container.keys.select {|key| key.to_s.start_with?(letter)}
    found_keys.map {|key| self[key]}
  end

  def each
      container.each do |key, value|
        yield key, value
      end
  end
  
  private
  def normalize_key(key)
    key.to_sym
  end
end