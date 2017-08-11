class LRUCache
   def initialize(size)
     @cache = []
     @size = size
   end

   def count
     @cache.count
   end

   def add(el)
     if @cache.include?(el)
       @cache.delete(el)
     elsif count >= @size
       @cache.shift
     end
     @cache << el
   end

   def show
    p @cache
   end
end
