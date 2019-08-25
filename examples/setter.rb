class User
    attr_accessor :first_name, :mail

    def initialize(attributes = {})
        @first_name = attributes[:n]
        @mail = attributes[:m]
    end

    def info
        "#{@first_name} #{@mail}"
    end

    # def name
    #     @name
    # end

    # def name=(name)
    #     @name = name
    # end

    # def mail
    #     @mail
    # end

    # def mail=(mail)
    #     @mail = mail
    # end



end

user = User.new({n: "wangjuan", m: "wangjuan@126.com"})
puts user.info
puts user.first_name
puts user.mail
user.first_name = "chenxu"
user.mail = "xxx"
puts user.first_name
puts user.mail

