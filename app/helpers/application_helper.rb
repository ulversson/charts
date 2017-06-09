module ApplicationHelper
  
  def chart_buttons
    Charts::Config.config.each.map do |config_key, values|
      link_to config_key.capitalize, 
                          chart_path(config_key), 
                          "data-chart" => config_key,
                          class: "button btn-success btn-lg chart-button"
      
    end.join("&nbsp;").html_safe
  end
end
