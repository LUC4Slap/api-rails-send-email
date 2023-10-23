class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decode_token
        auth_header = request.headers['Authorization']
        puts auth_header
        if auth_header
            token = auth_header.split(" ").last
        begin
          JWT.decode(token, 'secret', true, algorithm: 'HS256')
        rescue JWR::DecodeError
            nil
        end
        end
    end

    def atuhorized_user
        decode_token = decode_token()
        if decode_token
            @decode_token_user = decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: "Você precisa estar logado!"}, stauts: :unauthorized unless atuhorized_user
    end
end
