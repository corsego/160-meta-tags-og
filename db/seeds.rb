path = "https://raw.githubusercontent.com/ruby-conferences/ruby-conferences.github.io/master/_data/conferences.yml"
uri = URI.open(path)
yaml = YAML.load_file uri, permitted_classes: [Date]

yaml.each do |event|
  Event.create!(
    name: event["name"],
    location: event["location"],
    start_date: event["start_date"],
    end_date: event["end_date"],
    twitter: event["twitter"],
    video_link: event["video_link"]
  )
end