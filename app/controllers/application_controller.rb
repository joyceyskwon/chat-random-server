class ApplicationController < ActionController::API

  def curr_user
    begin
      User.find_by(id: decode_token)
    rescue
      nil
    end
  end 
  
end
