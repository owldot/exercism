class Bob
  def self.hey(remark)
    if test_silence(remark)
      return 'Fine. Be that way!'
    end

    if test_yell(remark) && test_question(remark)
      return "Calm down, I know what I'm doing!"
    end

    if test_question(remark)
      return 'Sure.'
    end

    if test_yell(remark)
      return 'Whoa, chill out!'
    end

    'Whatever.'
  end

  def self.test_question(message)
    message =~ /\?\s*\?*\z/
  end

  def self.test_yell(message)
    letters_only = message.gsub(/[^A-Za-z]/, '')

    letters_only != '' && letters_only.upcase == letters_only
  end

  def self.test_silence(message)
    message =~ /\A\z|\A\s+\z/
  end
end