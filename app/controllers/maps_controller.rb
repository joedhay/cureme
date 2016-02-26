class MapsController < ApplicationController

  def get_user_coordinates
    latitude = params[:latitude]
    longitude =  params[:longitude]

    if latitude.present? && longitude.present?
      locs = []
      path = "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=true"
      result = Net::HTTP.get(URI.parse(path))
      if result.present?
        JSON.parse(result).each_with_index do |a,index|
          begin
            if a[1] != 'OK'
              a[1].each do |f|
                locs << f['formatted_address']
              end
            end
          rescue
            locs = []
          end


        end
        puts locs[0]
      end

      render :json => { :state => 'valid',:location => locs[0].present? ? locs[0] : ''}
    end

    if params[:me].present?
      user = User.find(session[:user_logged_id])
      coords = Geocoder.coordinates(user.address)


      if coords.present?
        render :json => { :state => 'valid',:latitude => coords[0],:longitude => coords[1]}
      else
        render :json => { :state => 'invalid'}
      end

    end


  end

end