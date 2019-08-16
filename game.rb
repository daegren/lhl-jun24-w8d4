require './robot'

class Game

  def initialize
    @robots = [
      Robot.new('HAL 9000'),
      Robot.new('Megabyte'),
      Robot.new('Renegade Enzo'),
      Robot.new('Megatron'),
      Robot.new('Optimus Prime')
    ]
    @round = 1
    @attacking_robot_index = rand(@robots.count)
  end

  def play
    while not game_over?
      header "ROUND ##{@round}"

      attacking_robot = @robots[@attacking_robot_index]

      if attacking_robot.dead?
        puts "#{attacking_robot.name} is dead ☠️"
      else
        target = target_robot attacking_robot
  
        puts "#{attacking_robot.name} is attacking #{target.name}"
  
        damage_amount = attacking_robot.attack target
  
        puts "#{attacking_robot.name} did #{damage_amount} damage"
      end

      header "SUMMARY"

      @robots.each do |r|
        puts r
      end

      next_round

      sleep 0.5
    end

    header "🏆 WINNER! 🏆"
    puts "#{alive_robots.first.name} has won the robot fight!"
  end


  private

  def target_robot attacker
    @robots.filter { |r| r != attacker && (not r.dead?) }.sample
  end

  def next_round
    @round += 1
    @attacking_robot_index = (@attacking_robot_index + 1) % @robots.count
  end

  def header content
    puts
    puts "======="
    puts content
    puts "======="
    puts
  end

  def game_over?
    alive_robots.count == 1
  end

  def alive_robots
    @robots.filter { |r| not r.dead? }
  end

end
