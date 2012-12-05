#a class for dice.

class Dice
  def initialize number_of_sides
    @die_number = number_of_sides
   #end of the initialize method
  end 



 



  def roll times, modifier
   total = 0 
    times.times do
     total += (rand(@die_number) + 1) + modifier 
   end #end of the times do block..
    total 
  end  #end of roll method.


end   #end of the dice class.
