class ChartsController < ApplicationController
  
  def index
  end  
  
  def show
    chart_config = Charts::Config.config[params[:name]]
    if chart_config[:storage_key]
      @chart = Charts::Types::RedisChart.new(
                    params[:chart_name].to_s.capitalize, 
                    chart_config[:request_url], 
                    chart_config[:storage_key]
                    )
    else
      @chart = Charts::Types::NonRedisChart.new(
                    params[:chart_name].to_s.capitalize, 
                    chart_config[:request_url]
                    )
      @chart.response_processor = response_processor_klass(chart_config[:response_processor]).new              
    end    
    render json: @chart.chart_data              
  end  
  
  private
  
  def response_processor_klass(klass_name)
    "Charts::ResponseProcessors::#{klass_name}".constantize  
  end    
  
end
