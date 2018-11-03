module ActsAsCsv

    def self.included(base)
        puts "#{self} included in #{base}"
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods

        def read
            @csv_contents = []
            File.open(self.class.to_s.downcase + ".txt") do |f|
                @headers = f.gets.chomp.split(', ')

                f.each_line do |row|
                    @csv_contents << row.chomp.split(', ')
                end
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each
            length = @csv_contents.size
            i = 0
            while i < length
                yield CsvRow.new(@csv_contents[i])
                i += 1
            end
        end

        

    end
end


class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

class CsvRow
    attr_accessor :contents

    def initialize(contents)
        @contents = contents[0].split(', ') rescue 0
    end

    def method_missing(name, *args)
        list = {one: "No1", two: "No2", three: "No3"}
        list[name.to_sym]
    end

end


m = RubyCsv.new
p m.headers
p m.csv_contents
m.each {|row| puts row.one}
m.each {|row| puts row.three}

