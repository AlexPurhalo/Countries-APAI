require 'helper_spec'

describe 'GET countries/:code/cities' do
  before { Countries.before { env['api.tilt.root'] = 'app/views' } }

  before do
    country = Country.create(name: 'Ukraine', code: 'ua')

    city_params = {
        name:      'Kiev',
        lat_coord: 50.433334,
        lon_coord: 30.516666,
        country_id: country.id
    }

    City.create(city_params)
  end

  let (:city) { City.where(name: 'Kiev').first }

  before { get '/countries/ua/cities'  }

  let (:records) { JSON.parse(last_response.body) }

  it 'has 200 status' do
    expect(last_response.status).to eq 200
  end

  it 'contains a right cities list' do
    expect(records.count).to eq 1
  end

  it 'each item has right keys' do
    records_keys, attributes = records.sample.keys, %w(name country)
    expect((records_keys | attributes).count).to eq (attributes.count)
  end
end
