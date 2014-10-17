class LoadSpeakers
  include Singleton
  attr_reader :speakers

  def initialize
    file = YAML.load_file('config/speakers.yml')
    @speakers = file.fetch('speakers')
  end

  private

  def select_country_by(value)
    @countries.values.select do |country|
      country.values.include?(value)
    end
  end
end
