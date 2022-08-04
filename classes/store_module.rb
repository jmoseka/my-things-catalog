module StoreModule
  def save_data(data, file_name)
    File.write("./data/#{file_name}.json", JSON.generate(data)) if data.any?
  end
end
