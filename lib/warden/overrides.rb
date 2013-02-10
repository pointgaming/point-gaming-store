module Warden
  class SessionSerializer

    def key_for(scope)
      "warden.storeUser.#{scope}.key"
    end
  end
end
