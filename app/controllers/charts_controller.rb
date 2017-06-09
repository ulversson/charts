class ChartsController < ApplicationController
  
  def index
  end  
  
  def show
    chart_config = Charts::Config.config[params[:name]]
    @chart = Charts::Chart.new(
                  params[:chart_name].to_s.capitalize, 
                  chart_config[:request_url], 
                  chart_config[:storage_key]
                  )
    render json: @chart.chart_data              
  end  
  
end
