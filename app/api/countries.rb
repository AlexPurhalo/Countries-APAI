class Countries < Grape::API
  resources :countries do
    get '/',  rabl: 'countries' do
      @countries = Country.all
    end

    get '/:code/cities' do
      @country = Country.where(code: params[:code]).first

      unless @country
        error_params = {
            error:   'unexpected error',
            details: 'country is not found'
        }

        error!(error_params, 500)
      end

      @cities = @country.cities

      render rabl: 'cities'
    end
  end
end