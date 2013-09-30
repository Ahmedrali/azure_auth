class AuthController < ApplicationController

  # redirect the user to peerialism authentication Hub
  def authenticate
    authenticatorURL = "https://peerialism.azurewebsites.net/"
    return_url = "#{root_url}azure_auth"
    query_params = (request.query_string.nil? || request.query_string.empty?) ? "" : "#{request.query_string}&"
    url = "#{authenticatorURL}?#{query_params}peerauth-return=#{return_url.encode}"
    redirect_to url
  end

  # Handle the redirected user request after the authentication process
  def azure_auth
    if (email = authenticated?)
      email_pat = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      unless email =~ email_pat
        flash[:alert] = "Unknown email: #{email}"
        redirect_to root_path
        return
      end
      user = User.where(:email => email).first
      unless user
        password = Devise.friendly_token[0,8]
        user = User.create(
                           email:email,
                           password:password,
                           password_confirmation:password
                           )
      end
      
      if user.email_confirmed?
        sign_in_and_redirect user, :event => :authentication
      else
        redirect_to root_path, :notice => I18n.t(:conf_msg, :scope => [:messages, :controllers, :invitations])
      end
    else
      flash[:alert] = "No email found."
      redirect_to root_path
    end
  end

  private
  
  # check if the user is authenticated right or not.
  def authenticated?
    if params.include?("token")
      email, role, exp_date = decode(params["token"])
      if !email.empty? and (DateTime.strptime(exp_date, '%Y%m%d%H%M%S') >= DateTime.now or Rails.env.test?)
        return email
      end
    end
  end

  # Decode the given token
  def decode(token)
    key = "IOUWHEIJHDLKJHPiuhpsdih98392hjhsad"
    decipher = OpenSSL::Cipher::AES.new(128, :CBC)
    decipher.decrypt
    decipher.key = key
    decipher.iv = key
    plain = decipher.update(Base64.decode64(token)) + decipher.final
    plain.split("|")
  end

end
