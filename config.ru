
require 'roda'

class App < Roda
  plugin :all_verbs

  route do |r|
    r.root do
      "get://root"
    end

    r.is String do |channel|
      r.get do
        sleep 10  # simulate a blocking call
        "get://channels/#{channel}"
      end

      r.post do
        <<~EOS
          post://channels/#{channel}\n
          #{r.params.inspect}"
        EOS
      end

      r.delete do
        <<~EOS
          delete://channels/#{channel}\n
          #{r.params.inspect}
        EOS
      end
    end
  end

end

run App.freeze.app

