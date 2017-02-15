class PagesController < ApplicationController
	require 'csv'

  def home
  	@lots = Lot.last(3)
  end
  def smarter
  	sum = 0
  	csv_data = []
  end

end
