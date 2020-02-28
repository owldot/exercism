class Tournament
  class << self

    LINE_FORMAT = '%-31s| %2s | %2s | %2s | %2s | %2s'.freeze

    def tally(input)
      records = parse_data(input.strip)

      output = format(LINE_FORMAT,
                      'Team',
                      'MP',
                      'W',
                      'D',
                      'L',
                      'P').concat("\n")
      sort_teams_alphabetically(records).each do |record|
        output << format(LINE_FORMAT,
                         record[:team],
                         record[:mp],
                         record[:w],
                         record[:d],
                         record[:l],
                         record[:p]).concat("\n")
      end
      output
    end

    def parse_data(input)
      records = {}
      input.lines.each do |line|
        team1, team2, game = line.split(';').map(&:strip)
        if records.key?(team1)
          records[team1] = update_record(
            records[team1],
            points_for_first_team(game, team1)
          )
        else
          records[team1] = points_for_first_team(game, team1)
        end

        if records.key?(team2)
          records[team2] = update_record(
            records[team2],
            points_for_second_team(game, team2)
          )
        else
          records[team2] = points_for_second_team(game, team2)
        end
      end
      records
    end

    def update_record(existing_record, new_record)
      res = {}
      existing_record.keys.each do |key|
        if key == :team
          res[key] = existing_record[key]
          next
        end
        res[key] = existing_record[key] + new_record[key]
      end
      res
    end

    def points_for_first_team(game, team)
      if game == 'win'
        {mp: 1, w: 1, d: 0, l: 0, p: 3, team: team}
      elsif game == 'draw'
        {mp: 1, w: 0, d: 1, l: 0, p: 1, team: team}
      elsif game == 'loss'
        {mp: 1, w: 0, d: 0, l: 1, p: 0, team: team}
      end
    end

    def points_for_second_team(game, team)
      if game == 'win'
        {mp: 1, w: 0, d: 0, l: 1, p: 0, team: team}
      elsif game == 'draw'
        {mp: 1, w: 0, d: 1, l: 0, p: 1, team: team}
      elsif game == 'loss'
        {mp: 1, w: 1, d: 0, l: 0, p: 3, team: team}
      end
    end

    def sort_teams_alphabetically(games)
      games.sort_by { |_, game| [-game[:p], game[:team]] }.map(&:last)
    end
  end
end