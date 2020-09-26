# # Anagrams
# # Our goal today is to write a method that determines if two given words are anagrams. 
# # This means that the letters in one word can be rearranged to form the other word. For example:

# # anagram?("gizmo", "sally")    #=> false
# # anagram?("elvis", "lives")    #=> true
# # Assume that there is no whitespace or punctuation in the given strings.

# # Learning Goals
# # Be able to determine the time and space complexity of a method
# # Be able to recognize when and how time or space complexity can be improved
# # Be able to compare different methods and discuss how changing inputs affects each one's overall runtime
# # Phase I:
# # Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# # Check if the second string is one of these.
def first_anagram?(str1, str2)
    possible = str1.split("").permutation.to_a #O(n!)
    possible.include?(str2.split("")) #n
end 

p first_anagram?("cat", "tac")

# # Hints:

# # For testing your method, start with small input strings, otherwise you might wait a while
# # If you're having trouble generating the possible anagrams, look into this method.
# # What is the time complexity of this solution? What happens if you increase the size of the strings?

# # Phase II:
# # # Write a method #second_anagram? that iterates over the first string. For each letter in the first string, 
# # find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. 
# # The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

def second_anagram?(str1, str2) #n*m
    str1 = str1.split("") #n
    str2 = str2.split("") #m
    str1.each do |char| #n
        loc = str2.find_index(char) #m ... n*m
        if loc.nil?  
            return false 
        else
            str2.delete_at(loc)  #m
        end 
    end 
    return true if str2.empty? 
end 

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# # Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# # Phase III:
# # Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# # The strings are then anagrams if and only if the sorted versions are the identical.
def third_anagram?(str1,str2)
    str1.split("").sort == str2.split("").sort #  nlogn
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")  
# # What is the time complexity of this solution? Is it better or worse than #second_anagram??

# # Phase IV:
# # Write one more method #fourth_anagram?. 
# # This time, use two Hashes to store the number of times each letter appears in both words. 
# # Compare the resulting hashes.
def fourth_anagram?(str1,str2)
    h1 = make_hash(str1) #n
    h2 = make_hash(str2) #n 
    h1 == h2
end 

def make_hash(str)
    h = Hash.new(0)
    str.each_char do |char|
        h[char]+=1
    end 
    h
end 

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")  

# # What is the time complexity?
# #catss

require "byebug"
def final_anagram?(str1,str2) #n
    return false unless str1.length == str2.length
    h = Hash.new(0)
    str1.each_char {|char| h[char]+=1}
    str2.each_char do |char|
        return false unless h.has_key?(char)
        h[char]+=1
    end
    h.values.all? {|v| v.even?}
end 

p final_anagram?("gizmo", "sally")    #=> false
p final_anagram?("elvis", "lives")  

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.

