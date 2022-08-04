module StoreModule
  def save_data(data, file_name)
    File.write("./data/#{file_name}.json", JSON.generate(data)) if data.any?
  end

  def load_data(file_name)
    if File.exist?("./data/#{file_name}.json")
      JSON.parse(File.read("./data/#{file_name}.json"))
    else
      []
    end
  end
end
