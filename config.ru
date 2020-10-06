
require 'roda'

class App < Roda
  plugin :all_verbs

  route do |r|
    r.root do
      "get://root"
    end

    r.is String do |channel|
      r.get do
        sleep 10
        "get://channels/#{channel}"
      end

      r.post do
        "post://channels/#{channel}" + 
          "\n" + 
          r.params.inspect
      end

      r.delete do
        "delete://channels/#{channel}" + 
          "\n" +
          channel + 
          " \n" + 
          r.params.inspect
      end
    end
  end

end

run App.freeze.app

