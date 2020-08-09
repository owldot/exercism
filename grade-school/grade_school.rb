class School
  def initialize
    @db = {}
  end

  def add(name, grade)
    @db[grade] ||= []

    @db[grade].push(name).sort!
  end

  def students(grade)
    if @db.key?(grade)
      @db[grade]
    else
      []
    end
  end

  def students_by_grade
    @db.map do |grade, names|
      {grade: grade, students: names}
    end.sort { |grade1, grade2| grade1[:grade] <=> grade2[:grade] }
  end
end
