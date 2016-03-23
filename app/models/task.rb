class Task
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    puts "this is the data: #{data}!!!"
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
  end
end
