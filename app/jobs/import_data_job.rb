class ImportDataJob < ApplicationJob
	self.queue_adapter = :resque
  queue_as :default

  def perform(csv_url, csv_id)
  	csv_data = []
    BulkUpload.update(csv_id, {:status => 1})
  	url = "/Users/amanullahtanweer/Projects/mitsab/public#{csv_url}"
  	puts url
    CSV.foreach(url, headers: true, :encoding => 'ISO-8859-1') do |row|
      lot = {
              yard_number: row['Yard number'],
              yard_name: row['Yard name'],
              sale_date: row['Sale Date M/D/CY'],
              sale_time: row['Sale time (HHMM)'],
              item_no: row['Item#'],
              lot_number: row['Lot number'],
              vehicle_type: row['Vehicle Type'],
              year: row['Year'],
              make: row['Make'],
              model_group: row['Model Group'],
              model_detail: row['Model Detail'],
              body_style: row['Body Style'],
              color: row['Color'],
              damage_description: row['Damage Description'],
              secondary_damage: row['Secondary Damage'],
              sale_title_state: row['Sale Title State'],
              sale_title_type: row['Sale Title Type'],
              has_keys: row['Has Keys-Yes or No'],
              lot_cond_code: row['Lot Cond. Code'],
              vin: row['VIN'],
              odometer: row['Odometer'],
              odometer_brand: row['Odometer Brand'],
              est_retail_value: row['Est. Retail Value'],
              engine: row['Engine'],
              drive: row['Drive'],
              transmission: row['Transmission'],
              fuel_type: row['Fuel Type'],
              cylinders: row['Cylinders'],
              runs_drives: row['Runs/Drives'],
              sale_status: row['Sale Status'],
              high_bid: row['High Bid :non-vix],Sealed:Vix'],
              special_note: row['Special Note'],
              city: row['Location city'],
              state: row['Location state'],
              zip: row['Location ZIP'],
              country: row['Location country'],
              currency_code: row['Currency Code'],
              thumbnail: row['Image Thumbnail'],
              cop_created_date: row['Create Date/Time'],
              grid_rows: row['Grid/Row'],
              offer_eligible: row['Make-an-Offer Eligible'],
              buy_now_price: row['Buy-It-Now Price']
            }
      csv_data << lot
    end
      Lot.create(csv_data)
      BulkUpload.update(csv_id, {:status => 2})
		end

  end
