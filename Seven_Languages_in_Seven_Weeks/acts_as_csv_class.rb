class ActsAsCsv
    def read
        puts self.class.to_s
        file = File.open(self.class.to_s.downcase + '.txt')
        @headers = file.gets.chomp.split(', ')

        file.each_line do |row|
            @result << row.chomp.split(', ')
        end
    end

    def headers
        @headers

    end

    def csv_counters
        @result
    end

    def initialize
        @result = []
        read
    end

end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
p m.headers
p m.csv_counters
