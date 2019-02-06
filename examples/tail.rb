def tail(lineno, file_name)
  File.open(file_name) do |file|
    arr = file.readlines
    if arr.size > lineno
      puts arr[-lineno, lineno]
    else
      puts arr
    end
  end
end

tail(2, 'test.txt')