require 'helper_spec'

describe 'GET countries' do
  before { Countries.before { env['api.tilt.root'] = 'app/views' } }

  before do
    Country.create(name: 'Saint Lucia', code: 'LC')
    Country.create(name: 'Samoa',       code: 'WS')
  end

  before { get '/countries/'  }

  let (:records) { JSON.parse(last_response.body) }

  it 'has 200 status' do
    expect(last_response.status).to eq 200
  end

  it 'contains all items' do
    expect(records.count).to eq 2
  end

  it 'each item has right keys' do
    records_keys, attributes = records.sample.keys, %w(id name code)
    expect((records_keys | attributes).count).to eq (attributes.count)
  end
end