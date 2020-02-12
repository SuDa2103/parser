class Parser
  attr_reader :entries
  attr_reader :most_hash
  def initialize(logfile_path)
    @logfile_path = logfile_path
    @entries = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    File.open(@logfile_path).each do |line|
      page, ip_address = line.split(/\s+/)
      @entries[page] << ip_address
    end
    @entries
  end

  def most_page_views
    @most = Hash.new { |hash, key| hash[key] = [] }
    @entries.each do |key, value|
      @most[key] << value.size
    end
    @most_hash = Hash[@most.sort_by { |k, v| v }.reverse]
    puts "Ordered by Most Views: #{@most_hash}"
    @most
  end

  def unique_page_views
    @unique = Hash.new { |hash, key| hash[key] = [] }
    @entries.each do |key, value|
      @unique[key] << value.uniq.size
    end
    puts "Ordered by Unique Views #{Hash[@unique.sort_by { |k, v| v }.reverse]}"
    @unique
  end
end

parser = Parser.new(ARGV[0])
parser.parse
parser.most_page_views
parser.unique_page_views
