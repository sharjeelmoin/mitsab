module ApplicationHelper

	def thumbnail_large(thumbnail)
		if thumbnail.present?
			url = thumbnail[0...-4]
			thumbnail = "http://#{url}X.JPG"
		else
			thumbnail = "/no-car.png"
		end
		return thumbnail
	end

	def slider_image(thumbnail, number)
		url = thumbnail[0...-5]
		thumbnail = "http://#{url}#{number}X.JPG"
		return thumbnail
	end

	def date_long(date)
		if date.past?
			return "Future"
		else
			date.strftime("%a. %b %d, %Y")
		end
	end
end
