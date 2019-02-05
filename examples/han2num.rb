

def han2num(han)
    printf("han2num, %s\n", han)
    han2numtable = {
    "一"=> 1, 
    "二"=> 2, 
    "两"=> 2,
    "三"=> 3, 
    "四"=> 4, 
    "五"=> 5, 
    "六"=> 6, 
    "七"=> 7, 
    "八"=> 8, 
    "九"=> 9, 
    "十" => 10, 
    "百" => 100,
    "千" => 1000
    }
    num_arry = []
    sum = 0
    han.each_char {|i| num_arry << han2numtable[i]}
    puts num_arry.join(" ")
    if (num_arry.size % 2)
        #num_arry << 1 
    end
    puts num_arry.join(" ")
    for i in (0...num_arry.size).step(2)
        if i + 1 < num_arry.size
            printf("ddddd1: %d, %d, %d, %d\n", i, sum, num_arry[i], num_arry[i+1])
            sum += num_arry[i]*num_arry[i+1]
            printf("ddddd2: %d, %d\n", i, sum)
        end
    end
    sum
end

puts han2num(ARGV[0])
