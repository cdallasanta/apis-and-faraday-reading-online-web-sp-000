class SearchesController < ApplicationController
  def search

  end

  def foursquare
    begin
      @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = '2HTYUAGVQC2YMIBNQHO4UGAGPCN5L3VWJNZRDBLVN5Z0D1O5'
        req.params['client_secret'] = 'ADW34IK4ZF540ZKTMLVUNHPD3GMEJJTA3KEXAGXOGJGY2VEB'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body["response"]["venues"]
      else
        @error = body["meta"]["errorDetail"]
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
