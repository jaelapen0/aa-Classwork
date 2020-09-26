# my_min
# Given a list of integers find the smallest number in the list.

# Example:

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

class Array
    def my_quick_sort(&prc)
        prc ||= Proc.new {|left, right| left<=> right} #O(1)
        return self if self.length < 2 #O(1)
        p = self.first #O(1)
        left = self[1..-1].select {|ele| prc.call(ele, p) == -1} #O(n)
        right = self[1..-1].select {|ele| prc.call(ele, p) != -1} #O(n)
        left.my_quick_sort(&prc) + [p] + right.my_quick_sort(&prc) 
        # n*logn                    
    end  
end 

def my_min(arr)
    arr.my_quick_sort[0] #O(nlogn)
end 

def my_min(arr)
    var = arr[0] 
    (1...arr.length).each {|i| var = arr[i] if var>arr[i]} #O(n)
    var 
end 

p my_min(list)  # =>  -5



# -------------------------------------------------

def largest_contiguous_subsum(list) #n^2?
    h = Hash.new(0) #O(1)
    (0...list.length-1).each do |i1| #(n)
        (i1...list.length).each do |i2| #(n)
            str = list[i1..i2].join("_") #n?
            h[str] = list[i1..i2].sum # 2n
        end
    end
    sortd= h.sort_by {|k,v| v} #nlogn
    sortd[-1][-1] #1
end 

def largest_contiguous_subsum(list)
    larg = list[0]
    curr = list[0]
    i = 1
    while i < list.length
        curr = 0 if curr<0
        curr +=list[i]
        i+=1
        larg = curr if curr > larg
    end
    return larg
end 

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


