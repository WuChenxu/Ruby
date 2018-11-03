class ActsAsCsv
    def self.acts_as_csv

        define_method(:read) do
            File.open(self.class.to_s.downcase + '.txt') do |f|
                @headers = f.gets.chomp.split(', ')

                f.each_line do |row|
                    @result << row.chomp.split(', ')
                end

            end
        end

        define_method(:headers) do
            @headers
        end

        define_method(:csv_content) do
            @result

        end

        define_method(:initialize) do
            @result = []
            read
        end

    end
end

class RubyCsv < ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
p m.headers
p m.csv_content

