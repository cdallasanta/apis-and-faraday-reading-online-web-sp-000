class SearchesController < ApplicationController
  def search

  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = '2HTYUAGVQC2YMIBNQHO4UGAGPCN5L3VWJNZRDBLVN5Z0D1O5'
      req.params['client_secret'] = 'ADW34IK4ZF540ZKTMLVUNHPD3GMEJJTA3KEXAGXOGJGY2VEB'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end

    render 'search'
  end
end
