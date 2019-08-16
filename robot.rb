class Robot
  attr_reader :name

  MAX_HP = 50

  def initialize name
    @name = name
    @hp = MAX_HP
    @ap = 10
  end

  def attack other_robot
    damage = rand(10) + 1
    if berserk?
      damage *= 2
    end
    other_robot.take_damage damage

    damage
  end

  def take_damage amount
    @hp -= amount
  end

  def to_s
    "#{name}: #{@hp}HP #{status}"
  end

  def status
    if dead?
      "☠️"
    elsif berserk?
      "😤"
    end
  end

  def dead?
    @hp <= 0
  end

  def berserk?
    @hp <= MAX_HP * 0.2
  end

end
