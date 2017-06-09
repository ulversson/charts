require "charts"
Charts::Config.config = YAML.load_file(
  Rails.root.join("config/charts.yml")
).fetch(Rails.env).with_indifferent_access