object @cities
attributes :name
child(:country) { attributes :id, :name, :code }