module ApplicationHelper
  def speakers
    return @speakers if @speakers

    file = YAML.load_file('config/speakers.yml')
    @speakers = file.fetch('speakers')
  end

  def talks
    return @talks if @talks

    file = YAML.load_file('config/talks.yml')
    @talks = file.fetch('talks')
  end
end
