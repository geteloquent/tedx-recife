module ApplicationHelper
  def speakers
    return @speakers if @speakers

    file = YAML.load_file('config/speakers.yml')
    @speakers = file.fetch('speakers')
  end
end
