module ApplicationHelper

	def body_class
		["mitsab", action_name].join('-')
	end

	def bootstrap_class_for flash_type
		{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages(opts = {})
    flash.each do |msg_type, message|
      if msg_type != "api_errors"
      concat(content_tag(:div, message, class: "bs-alert alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
      end
    end
    nil
  end


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
