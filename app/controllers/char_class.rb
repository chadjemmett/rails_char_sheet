#experimenting with a class that creates characters.

class Character
  #setting the getter and setter methods and variables.
  attr_accessor :stats_array, :class, :race, :level, :hp, :ac, :basic_attack, :str, :dex, :con, :int, :wis, :cha, :gp

  def initialize
   dice = Proc.new do #here's the dice proc. Not sure how to make this more efficient.
     |total|
       total = 0
         total += rand(6) + 1
         total += rand(6) + 1
         total += rand(6) + 1	 
   end #end of the dice proc.
   #creating the stats and mods array.
  @stats_array = Array.new(6){Array.new << dice.call} #we calculate all the stats and put them in an array using the above block.
  @stats_array.each {|item| item << (item[0] - 10)/2}  #here we figure the modifier 
  #not sure if defining all the stats is worthwile.
 # @str = @stats_array[0][0]
 # @dex = @stats_array[1][0]
 # @con = @stats_array[2][0]
 # @int = @stats_array[3][0]
 # @wis = @stats_array[4][0]
 # @cha = @stats_array[5][0]

 #here we use the next method to choose race and class.
 self.race_class_select
  end #end of initialize method.
  
  def race_class_select
    #here we put all the main stats into an array. 
    temp_stats_array = []
    @stats_array.each {|item| temp_stats_array <<  item[0]}
    #then we compare the hightest scores. We choose class based on scores.
     if temp_stats_array.max == @stats_array[0][0]
       @class = :fighter
     elsif
       temp_stats_array.max == @stats_array[1][0]
       @class = :thief
     elsif
       temp_stats_array.max == @stats_array[2][0]
         @class = [:fighter, :cleric].sample
     elsif
       temp_stats_array.max == @stats_array[3][0]
         @class = :magic_user
     elsif
       temp_stats_array.max == @stats_array[4][0]
         @class = :cleric
     elsif
       temp_stats_array.max == @stats_array[5][0]
         @class = [:thief, :magic_user].sample
     end
    #here we just choose race at random.
    @race = [:dwarf, :human, :elf, :halfling].sample
  end #end of race_class_select




  def stats
  #this method will process the stats into a markaby or erb or whatnot. Right now it just 'puts' them for testing.
     @stats_array.each do
     |item| 
     puts item[0].to_s
     end #end of teh each block
  end #end of stats method.

  def modifiers
    @stats_array.each {|item| return item[1]}
  end #end of modifiers method


end #end of the character class.

