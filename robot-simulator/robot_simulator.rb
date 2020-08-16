class Robot
  DIRECTION = {
    east: [1, 0],
    west: [-1, 0],
    north: [0, 1],
    south: [0, -1]
  }.freeze

  attr_reader :bearing

  def initialize
    @bearing = :north
    @x = 0
    @y = 0
  end

  def coordinates
    [@x, @y]
  end

  def orient(direction)
    if DIRECTION.keys.include?(direction)
      @bearing = direction
    else
      raise ArgumentError
    end
  end

  def turn_right
    case bearing
    when :east
      @bearing = orient(:south)
    when :south
      @bearing = orient(:west)
    when :west
      @bearing = orient(:north)
    when :north
      @bearing = orient(:east)
    end
  end

  def turn_left
    case bearing
    when :east
      @bearing = orient(:north)
    when :south
      @bearing = orient(:east)
    when :west
      @bearing = orient(:south)
    when :north
      @bearing = orient(:west)
    end
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def advance
    @x += DIRECTION[bearing].first
    @y += DIRECTION[bearing].last
  end
end


class Simulator
  def instructions(string)
    commands = []
    string.chars.each do |command|
      case command.upcase
      when 'L'
        commands.push(:turn_left)
      when 'R'
        commands.push(:turn_right)
      when 'A'
        commands.push(:advance)
      end
    end
    commands
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions)
    instructions(instructions).each { |command| robot.public_send(command) }
  end
end