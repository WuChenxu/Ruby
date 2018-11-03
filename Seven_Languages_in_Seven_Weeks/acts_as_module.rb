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

    end
end


class RubyCsv
    include ActsAsCsv
    acts_as_csv
end


m = RubyCsv.new
p m.headers
p m.csv_contents

