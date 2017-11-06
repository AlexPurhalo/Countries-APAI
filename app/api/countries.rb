class Countries < Grape::API
  resources :countries do
    get '/',  rabl: 'countries' do
      @countries = Country.all
    end

    get '/:code/cities', rabl: 'cities' do
      @cities = Country.where(code: params[:code]).first.cities
    end
  end
end