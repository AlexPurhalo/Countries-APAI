object @cities
attributes :id, :name
child(:country) { attributes :id, :name, :code }