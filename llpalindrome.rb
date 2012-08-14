=begin
	A singly linked list is filled a character in each node. Write a function to 
	determine if the linked list is a palindrome. 
	Source: http://bit.ly/NeQy4h
	
	Here is my first crack at this problem, I have not viewed the hint or answer, so I may
	have a completely suboptimal solution.
	
	Also note: I did this in Ruby because I like what I've seen from Ruby so far
	and want to get better at it, but so far I'm very new to it.  That is also why
	I included a quick and dirty linked list impl, to improve my Ruby and make sure
	I still knew enough to write a linked list.
=end


class LinkedListEl 
	attr_accessor :nextItem, :object
	def initialize (obj)
		@object = obj
	end
end

class LinkedList
	attr_accessor :current, :head, :last, :length
	
	def initialize
		@length = 0
	end
	
	def reset
		@current = @head
	end
	
	def add(obj)
		if(!@last.nil?) 
			@last.nextItem = LinkedListEl.new obj
			@last = @last.nextItem
		else
			@current = LinkedListEl.new obj
			@head = @current
			@last = @head
		end
		@length += 1
	end
	
	def next
		nxt = @current
		if @current.nil?
			@current = @head
		else 
			@current = @current.nextItem 
		end
		
		nxt
	end
end


# Assume I didn't write the linked list
# so I'm opening the class and adding the method
LinkedList.class_eval do
	def palindrome?
		arr = []
		half = (@length / 2).ceil
		for i in 1..@length
			l = self.next
			next if i == half && @length%2 != 0 #handle odd length
			if i <= half
				arr.push l.object
			else 
				arr.pop if arr.last.eql? l.object
			end
		end
		arr.size == 0
	end
end

#test odd true
ot = LinkedList.new
ot.add 'd'
ot.add 'e'
ot.add 'a'
ot.add 'e'
ot.add 'd'
fail if !ot.palindrome?

#test odd false
of = LinkedList.new
of.add 'd'
of.add 'e'
of.add 'a'
of.add 'e'
of.add 'e'
fail if of.palindrome?

#test even true
et = LinkedList.new
et.add 'd'
et.add 'e'
et.add 'e'
et.add 'd'
fail if !et.palindrome?

#test even false
ef = LinkedList.new
ef.add 'd'
ef.add 'e'
ef.add 'a'
ef.add 'e'
fail if ef.palindrome?

