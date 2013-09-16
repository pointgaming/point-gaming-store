module Spree
  Order.class_eval do

    def finalize_with_logger!
      ::Resque.enqueue ::LogOrderJob, self.id
      finalize_without_logger!
    end
    alias_method_chain :finalize!, :logger

  end
end
