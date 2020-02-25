class TwelveDays
  LINES = [
    {first: 'a Partridge in a Pear Tree'},
    {second: 'two Turtle Doves'},
    {third: 'three French Hens'},
    {fourth: 'four Calling Birds'},
    {fifth: 'five Gold Rings'},
    {sixth: 'six Geese-a-Laying'},
    {seventh: 'seven Swans-a-Swimming'},
    {eighth: 'eight Maids-a-Milking'},
    {ninth: 'nine Ladies Dancing'},
    {tenth: 'ten Lords-a-Leaping'},
    {eleventh: 'eleven Pipers Piping'},
    {twelfth: 'twelve Drummers Drumming'}
  ].freeze

  class << self
    def song
      (0..11).map do |day|
        line(day)
      end.join("\n\n") + "\n" #last \n is present in txt sample
    end

    private

    def line(day)
      things = []
      LINES.each_with_index do |thing, index|
        break if index > day
        things << thing.values.first
      end

      if things.size > 1
        things.reverse!
        things_string = things[0...things.size - 1].join(', ') + ", and #{things.last}"
      else
        things_string = things.first
      end
      "On the #{LINES[day].keys.first} day of Christmas my true love gave to me: #{things_string}."
    end
  end
end