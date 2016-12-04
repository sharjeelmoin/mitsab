class PagesController < ApplicationController
	require 'csv'

  def home
  	@lots = Lot.last(8)
  end

  def csv
  	# Saving each row as hash into array of csv_data
  	csv_data = []
		CSV.foreach('/Users/amanullahtanweer/Projects/mitsab/public/importdata.csv', headers: true, :encoding => 'ISO-8859-1') do |row|
			csv_data << row.to_hash
		end

		csv_data.each do |row|
			lot                    = Lot.new
			lot.yard_number        = row['Yard number']
			lot.yard_name          = row['Yard name']
			lot.sale_date          = row['Sale Date M/D/CY']
			lot.sale_time          = row['Sale time (HHMM)']
			lot.item_no            = row['Item#']
			lot.lot_number         = row['Lot number']
			lot.vehicle_type       = row['Vehicle Type']
			lot.year               = row['Year']
			lot.make               = row['Make']
			lot.model_group        = row['Model Group']
			lot.model_detail       = row['Model Detail']
			lot.body_style         = row['Body Style']
			lot.color              = row['Color']
			lot.damage_description = row['Damage Description']
			lot.secondary_damage   = row['Secondary Damage']
			lot.sale_title_state   = row['Sale Title State']
			lot.sale_title_type    = row['Sale Title Type']
			lot.has_keys           = row['Has Keys-Yes or No']
			lot.lot_cond_code      = row['Lot Cond. Code']
			lot.vin                = row['VIN']
			lot.odometer           = row['Odometer']
			lot.odometer_brand     = row['Odometer Brand']
			lot.est_retail_value   = row['Est. Retail Value']
			lot.engine             = row['Engine']
			lot.drive              = row['Drive']
			lot.transmission       = row['Transmission']
			lot.fuel_type          = row['Fuel Type']
			lot.cylinders          = row['Cylinders']
			lot.runs_drives        = row['Runs/Drives']
			lot.sale_status        = row['Sale Status']
			lot.high_bid           = row['High Bid =non-vix,Sealed=Vix']
			lot.special_note       = row['Special Note']
			lot.city               = row['Location city']
			lot.state              = row['Location state']
			lot.zip                = row['Location ZIP']
			lot.country            = row['Location country']
			lot.currency_code      = row['Currency Code']
			lot.thumbnail          = row['Image Thumbnail']
			lot.cop_created_date   = row['Create Date/Time']
			lot.grid_rows          = row['Grid/Row']
			lot.offer_eligible     = row['Make-an-Offer Eligible']
			lot.buy_now_price      = row['Buy-It-Now Price']
			lot.save!
		end
		@lot = Lot.last
  	render json: @lot 
  end
end
