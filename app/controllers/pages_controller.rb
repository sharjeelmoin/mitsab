class PagesController < ApplicationController
	require 'csv'

  def home
  	@lots = Lot.last(3)
  end
  def smarter
  	sum = 0
  	csv_data = []
  end

  def csv
  	# Saving each row as hash into array of csv_data
  	base_url = "/home/sharjeel/projects/mitsab-rails/public/small.csv"
  	Resque.enqueue(Sleeper)
  	l = "done!"
  	render json: l
  end
end
